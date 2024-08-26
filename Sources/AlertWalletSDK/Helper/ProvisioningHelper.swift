//
//  ProvisioningHelper.swift
//
//
//  Created by Reddy on 23/08/24.
//

import Foundation
import PassKit
import os

class ProvisioningHelper: NSObject,PKAddSecureElementPassViewControllerDelegate{

    private static let logger = Logger(
        subsystem: Bundle.main.bundleIdentifier!,
        category: String(describing: ProvisioningHelper.self)
    )

    static let shared = ProvisioningHelper()
    public weak var delegate: AlertWalletControllerDelegate?
    public func initiateWalletProvisioning(with provisioningResponse: ProvisioningCredential , viewController: UIViewController , delegate: AlertWalletControllerDelegate?){
        Self.logger.info("ProvisioningHelper initiateWalletProvisioning Begin")
        var provisioningInfo = provisioningResponse.provisioningInformation
        provisioningInfo.environmentIdentifier = PropertiesManager.shared.getEnvironmentIdentifier() ?? "53b70cac-ec0c-4712-b7ba-995ddc119dfd"
        let provisioningCredentialIdentifier = provisioningInfo.provisioningCredentialIdentifier
        let cardTemplateIdentifier = provisioningInfo.cardTemplateIdentifier
        let sharingInstanceIdentifier = provisioningInfo.sharingInstanceIdentifier
        let environmentIdentifier = provisioningInfo.environmentIdentifier
        let ownerDisplayName = PropertiesManager.shared.getOwnerName() ?? "Johnny"
        let localizedDescription = PropertiesManager.shared.getPassDescription() ?? "Pass"
        self.delegate = delegate

        let passThumbnail = getPassThumbnailImage(product: PropertiesManager.shared.getPassProductForCardArt() ?? "alert-card_art")

        let preview = PKShareablePassMetadata.Preview(
            passThumbnail: passThumbnail.cgImage!,
            localizedDescription: localizedDescription)

        preview.ownerDisplayName = ownerDisplayName

        let passMetadata = PKShareablePassMetadata(
            provisioningCredentialIdentifier: provisioningCredentialIdentifier,
            sharingInstanceIdentifier: sharingInstanceIdentifier,
            cardTemplateIdentifier: cardTemplateIdentifier,
            preview: preview)

        if let envId = environmentIdentifier {
            passMetadata.serverEnvironmentIdentifier = envId;
        }

        if let accountHash = provisioningInfo.accountHash, let relyingPartyIdentifier = provisioningInfo.relyingPartyIdentifier {
            passMetadata.accountHash = accountHash
            passMetadata.relyingPartyIdentifier = relyingPartyIdentifier
        }

        PKAddShareablePassConfiguration.forPassMetadata([passMetadata], action: .add) { sePassConfig, err in
            guard let config = sePassConfig else {
                Self.logger.debug("intiateWalletProvisioning:: error creating pass config - \(String(describing: err))")
                return
            }
            guard let vc = self.createSEViewController(for: config) else { return }
            viewController.present(vc, animated: true)
        }
    }

    private func getPassThumbnailImage(product:String) -> UIImage {
        let bundle = Bundle.main
        return UIImage(named: product ,in: .main ,compatibleWith: nil)!
    }

    private func createSEViewController(for passConfig: PKAddShareablePassConfiguration) -> PKAddSecureElementPassViewController? {
        let canAddSePass = PassManager().canAddSePass(for: passConfig)
        guard canAddSePass else {
            Self.logger.error("intiateWalletProvisioning:: Unable to add an SE Pass with specified configuration")
            return nil
        }
        guard let vc = PKAddSecureElementPassViewController(configuration: passConfig, delegate: self) else {
            Self.logger.error("intiateWalletProvisioning:: Unable to create an SE Pass VC with specified configuration")
            return nil
        }
        return vc
    }

    func addSecureElementPassViewController(_ controller: PKAddSecureElementPassViewController, didFinishAddingSecureElementPasses passes: [PKSecureElementPass]?, error: (any Error)?) {
        if let error = error as? PKAddSecureElementPassError {
            delegate?.AlertWalletUIViewController(AlertWalletController.shared, onWalletProvisioningError: error.localizedDescription)
        }
        if (passes != nil ) {
            delegate?.AlertWalletUIViewController(AlertWalletController.shared, onWalletProvisioningSuccess: "Pass Added Successfully")
        }
        controller.dismiss(animated: true)
    }


    public func validateWalletProvisioning(with provisioningResponse: ProvisioningCredential , viewController: UIViewController , delegate: AlertWalletControllerDelegate?){
        Self.logger.info("ProvisioningHelper validateWalletProvisioning Begin")
        var provisioningInfo = provisioningResponse.provisioningInformation
        provisioningInfo.environmentIdentifier = PropertiesManager.shared.getEnvironmentIdentifier() ?? "53b70cac-ec0c-4712-b7ba-995ddc119dfd"
        let provisioningCredentialIdentifier = provisioningInfo.provisioningCredentialIdentifier
        let cardTemplateIdentifier = provisioningInfo.cardTemplateIdentifier
        let sharingInstanceIdentifier = provisioningInfo.sharingInstanceIdentifier
        let environmentIdentifier = provisioningInfo.environmentIdentifier
        let ownerDisplayName = PropertiesManager.shared.getOwnerName() ?? "Johnny"
        let localizedDescription = PropertiesManager.shared.getPassDescription() ?? "Pass"
        self.delegate = delegate
        let passThumbnail = getPassThumbnailImage(product: PropertiesManager.shared.getPassProductForCardArt() ?? "alert-card_art")

        let preview = PKShareablePassMetadata.Preview(
            passThumbnail: passThumbnail.cgImage!,
            localizedDescription: localizedDescription)

        preview.ownerDisplayName = ownerDisplayName

        let passMetadata = PKShareablePassMetadata(
            provisioningCredentialIdentifier: provisioningCredentialIdentifier,
            sharingInstanceIdentifier: sharingInstanceIdentifier,
            cardTemplateIdentifier: cardTemplateIdentifier,
            preview: preview)

        if let envId = environmentIdentifier {
            passMetadata.serverEnvironmentIdentifier = envId;
        }

        if let accountHash = provisioningInfo.accountHash, let relyingPartyIdentifier = provisioningInfo.relyingPartyIdentifier {
            passMetadata.accountHash = accountHash
            passMetadata.relyingPartyIdentifier = relyingPartyIdentifier
        }

        PKAddShareablePassConfiguration.forPassMetadata([passMetadata], action: .add) { sePassConfig, err in
            guard let config = sePassConfig else {
                Self.logger.error("intiateWalletProvisioning:: error creating pass config - \(String(describing: err))")
                return
            }
            let canAddSePass = PassManager().canAddSePass(for: config)
            if (canAddSePass){
                delegate?.AlertWalletUIViewController(AlertWalletController.shared, onPassAddValidation: true)
            } else{
                delegate?.AlertWalletUIViewController(AlertWalletController.shared, onPassAddValidation: false)
            }
        }
    }

}


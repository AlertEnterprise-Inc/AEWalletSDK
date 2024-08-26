//
//  AlertWalletController.swift
//
//
//  Created by Reddy on 22/08/24.
//

import Foundation
import UIKit
import PassKit
import WatchConnectivity
import os

public class AlertWalletController: UIViewController {

    private static let logger = Logger(
        subsystem: Bundle.main.bundleIdentifier!,
        category: String(describing: AlertWalletController.self)
    )

    public static let shared = AlertWalletController()
    public var delegate: AlertWalletControllerDelegate?


    private init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
    }

    /** response will be delegated to onEligibilityResult function*/
    public func checkEligibility(){
        Self.logger.debug("AlertWalletController checkEligibility invoked")
        if PKAddPassesViewController.canAddPasses() {
            delegate?.AlertWalletUIViewController(self, onEligibilityResult: true)
        } else {
            delegate?.AlertWalletUIViewController(self, onEligibilityResult: false)
        }
    }

    public func getRemotePasses() -> [PKSecureElementPass] {
        let passManager: PassManager = PassManager()
        return passManager.getRemoteSecureElementPasses()
    }

    public func getDevicePasses() -> [PKPass]{
        let passManager: PassManager  = PassManager()
        return passManager.getPasses(of: .secureElement)
    }

    public func getPass(provisioningCredentialIdentifier: String) -> PKPass? {
        return PassManager().getPass(provisioningCredentialIdentifier: provisioningCredentialIdentifier)
    }

    public func isPassExists(provisioningCredentialIdentifier: String) -> Bool{
        return PassManager().isPassExists(provisioningCredentialIdentifier: provisioningCredentialIdentifier)
    }

    /** response will be delegated to IsWatched function*/
    public func isWatchPaired() {
        Self.logger.info("AlertWalletController isWatchPaired Begin")
        AppleWatchDetector.shared.delegate =  delegate
        AppleWatchDetector.shared.initialize()
    }
    public func checkIfWatchPaired() {
        Self.logger.info("AlertWalletController checkIfWatchPaired Begin")
        AppleWatchDetector.shared.delegate =  delegate
        AppleWatchDetector.shared.checkIfWatchIsPaired()
    }

    public func startPassProvisioning(userId: String, badgeId: String){
        Self.logger.info("AlertWalletController startPassProvisioning Begin")
        let payload = ProvisioningRequestPayload(userId:userId,badgeId:badgeId)
        APIService.shared.preparePass(payloadData: payload ){(result: Result<ProvisionAPISuccessResponse, ProvisionAPIErrorResponse>)in
            switch result{
            case .success (let data) :
                let credential : ProvisioningCredential  = data.credential!
                self.delegate?.AlertWalletUIViewController(self, onProvisioningSuccess: credential)
            case .failure(let error):
                self.delegate?.AlertWalletUIViewController(self, onProvisioningError: error)
            }
        }
    }

    public func saveToWallet(parentViewController: UIViewController, credential: ProvisioningCredential){
        Self.logger.info("AlertWalletController saveToWallet Begin")
        ProvisioningHelper.shared.initiateWalletProvisioning(with: credential, viewController: parentViewController, delegate: delegate)
    }

    public func canAddPass(parentViewController: UIViewController, credential: ProvisioningCredential){
        Self.logger.info("AlertWalletController saveToWallet Begin")
        ProvisioningHelper.shared.validateWalletProvisioning(with: credential, viewController: parentViewController, delegate: delegate)
    }
}

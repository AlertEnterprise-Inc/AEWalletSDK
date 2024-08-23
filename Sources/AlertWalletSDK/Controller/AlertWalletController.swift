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

public class AlertWalletController: UIViewController {
    
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
    
    
    public func checkEligibility(){
        let serverURL = PropertiesManager.shared.getServerURL()
        if (serverURL != nil){
            delegate?.isEligible(self, onEligibilityResult: true)
        }else{
            delegate?.isEligible(self, onEligibilityResult: false)
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
        AppleWatchDetector.shared.delegate =  delegate
        AppleWatchDetector.shared.initialize()
    }


    public func createProvisioningContext( identityId: String?, identityMobileCredentialId: String?,
                                           product: String, credentialType: String?,
                                           cardTemplateIdentifier: String?, passDefinitionIdentifier: String?) -> ProvisioningContext  {
        return ProvisioningContext(identityId: identityId, identityMobileCredentialId: identityMobileCredentialId,
                                   product: product, credentialType: credentialType,
                                   cardTemplateIdentifier: cardTemplateIdentifier, passDefinitionIdentifier: passDefinitionIdentifier)

    }



    public func startPassProvisioning(){
    }
    
    public func saveToWallet(parentViewController: UIViewController, thumbnail: String, displayName: String, description: String, saveLink: String){
    }
    
    public func syncPassToWatch(parentViewController: UIViewController, thumbnail: String, displayName: String, description: String, watchProvisioningBlob: String){
    }
    
    
}

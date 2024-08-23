//
//  AlertWalletControllerDelegate.swift
//  
//
//  Created by Reddy on 22/08/24.
//

import Foundation


public protocol AlertWalletControllerDelegate: AnyObject {
    func isEligible(_ controller: AlertWalletController, onEligibilityResult isEligible: Bool)
    func isWatchPaired(_ controller: AlertWalletController, isWatchPaired result: Bool)
    func provisioningError(_ controller: AlertWalletController,credentialCreateError credential: ProvisionAPIErrorResponse)
    func provisioningSuccess(_ controller: AlertWalletController, credentialCreateSuccess credential: ProvisioningCredential)
    func walletprovisioningError(_ controller: AlertWalletController, walletProvisioningError error: String)
    func walletprovisioningSuccess(_ controller: AlertWalletController, walletProvisioningSuccess success: String)
    func walletprovisioningValidation(_ controller: AlertWalletController, canAddPass result: Bool)
}

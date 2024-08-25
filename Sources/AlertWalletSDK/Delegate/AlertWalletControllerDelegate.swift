//
//  AlertWalletControllerDelegate.swift
//  
//
//  Created by Reddy on 22/08/24.
//

import Foundation


public protocol AlertWalletControllerDelegate: AnyObject {
    func AlertWalletController(_ controller: AlertWalletController, onEligibilityResult isEligible: Bool)
    func AlertWalletController(_ controller: AlertWalletController, isWatchPaired result: Bool)
    func AlertWalletController(_ controller: AlertWalletController, onProvisioningError error: ProvisionAPIErrorResponse)
    func AlertWalletController(_ controller: AlertWalletController, onProvisioningSuccess credential: ProvisioningCredential)
    func AlertWalletController(_ controller: AlertWalletController, onWalletProvisioningError error: String)
    func AlertWalletController(_ controller: AlertWalletController, onWalletProvisioningSuccess success: String)
    func AlertWalletController(_ controller: AlertWalletController, onPassAddValidation result: Bool)
}

//
//  AlertWalletControllerDelegate.swift
//  
//
//  Created by Reddy on 22/08/24.
//

import Foundation


public protocol AlertWalletControllerDelegate: AnyObject {
    func alertWalletController(_ controller: AlertWalletController, onEligibilityResult isEligible: Bool)
    func alertWalletController(_ controller: AlertWalletController, isWatchPaired result: Bool)
    func alertWalletController(_ controller: AlertWalletController, onProvisioningError error: ProvisionAPIErrorResponse)
    func alertWalletController(_ controller: AlertWalletController, onProvisioningSuccess credential: ProvisioningCredential)
    func alertWalletController(_ controller: AlertWalletController, onWalletProvisioningError error: String)
    func alertWalletController(_ controller: AlertWalletController, onWalletProvisioningSuccess success: String)
    func alertWalletController(_ controller: AlertWalletController, onPassAddValidation result: Bool)
}

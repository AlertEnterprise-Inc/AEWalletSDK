//
//  AlertWalletControllerDelegate.swift
//  
//
//  Created by Reddy on 22/08/24.
//

import Foundation


public protocol AlertWalletControllerDelegate: AnyObject {
    func AlertWalletUIViewController(_ controller: AlertWalletController, onEligibilityResult isEligible: Bool)
    func AlertWalletUIViewController(_ controller: AlertWalletController, isWatchPaired result: Bool)
    func AlertWalletUIViewController(_ controller: AlertWalletController, onProvisioningError error: ProvisionAPIErrorResponse)
    func AlertWalletUIViewController(_ controller: AlertWalletController, onProvisioningSuccess credential: ProvisioningCredential)
    func AlertWalletUIViewController(_ controller: AlertWalletController, onWalletProvisioningError error: WalletProvisioningResponse)
    func AlertWalletUIViewController(_ controller: AlertWalletController, onWalletProvisioningSuccess success: WalletProvisioningResponse)
    func AlertWalletUIViewController(_ controller: AlertWalletController, onPassAddValidation result: Bool)
}

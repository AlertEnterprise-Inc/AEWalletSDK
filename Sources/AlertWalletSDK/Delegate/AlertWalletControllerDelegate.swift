//
//  File.swift
//  
//
//  Created by Reddy on 22/08/24.
//

import Foundation


public protocol AlertWalletControllerDelegate: AnyObject {
    func isEligible(_ controller: AlertWalletController, onEligibilityResult isEligible: Bool)
    func isWatchPaired(_ controller: AlertWalletController, isWatchPaired result: Bool)
    func provisioningPending(_ controller: AlertWalletController)
    func provisioningSuccess(_ controller: AlertWalletController)
    func startProvisioning(_ controller: AlertWalletController, onReady data:NSObject)
}

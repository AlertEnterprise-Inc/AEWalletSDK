//
//  PassManager.swift
//
//
//  Created by Reddy on 23/08/24.
//

import Foundation
import PassKit

public class PassManager {

    public init() {}

    private var passLibrary:PKPassLibrary?

    public func getRemoteSecureElementPasses() -> [PKSecureElementPass] {
        passLibrary = PKPassLibrary()
        return passLibrary!.remoteSecureElementPasses
    }

    public func getPasses(of passType: PKPassType) -> [PKPass] {
        if !PKPassLibrary.isPassLibraryAvailable() { return [] }
        let passesOfType = PKPassLibrary().passes(of: passType)
        if passesOfType.isEmpty { return [] }
        return passesOfType
    }

    func getPass(provisioningCredentialIdentifier: String) -> PKPass? {
        let passes = getPasses(of: .secureElement)
        if isPassExists(provisioningCredentialIdentifier: provisioningCredentialIdentifier) {
            return passes.first{($0.paymentPass?.primaryAccountIdentifier.dropFirst(7))! == provisioningCredentialIdentifier}
        }
        return nil
    }

    func isPassExists(provisioningCredentialIdentifier: String) -> Bool {
        var exists = false
        let passes = getPasses(of: .secureElement)
        if passes.isEmpty { return false }
        exists = passes.contains {
            let sePass = $0 as! PKSecureElementPass
            return sePass.primaryAccountIdentifier.dropFirst(7) == provisioningCredentialIdentifier
        }
        return exists
    }

    func canAddSePass(for passConfig: PKAddShareablePassConfiguration) -> Bool
    {
        let canAddSePass = PKAddSecureElementPassViewController.canAddSecureElementPass(configuration: passConfig)
        guard canAddSePass else {
            return false
        }
        return canAddSePass
    }
}



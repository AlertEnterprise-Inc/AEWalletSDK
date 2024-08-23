//
//  ProvisioningHelper.swift
//
//
//  Created by Reddy on 23/08/24.
//

import Foundation
import PassKit

class ProvisioningHelper: NSObject{

    private var passLibrary:PKPassLibrary?

    func getRemoteSecureElementPasses() -> [PKSecureElementPass] {
        passLibrary = PKPassLibrary()
        return passLibrary!.remoteSecureElementPasses
    }

    func getPasses(of passType: PKPassType) -> [PKPass] {
        if !PKPassLibrary.isPassLibraryAvailable() { return [] }
        let passesOfType = PKPassLibrary().passes(of: passType)
        if passesOfType.isEmpty { return [] }
        return passesOfType
    }

}

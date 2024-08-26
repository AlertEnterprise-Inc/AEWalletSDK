//
//  ProvisioningCredential.swift
//  
//
//  Created by Reddy on 23/08/24.
//

import Foundation

public struct ProvisioningCredential: Codable {
    public var provisioningInformation: ProvisioningInformation

    public init(){
        self.provisioningInformation = ProvisioningInformation()
    }

    public init(provisioningInformation : ProvisioningInformation){
        self.provisioningInformation = provisioningInformation
    }
}

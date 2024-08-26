//
//  ProvisionAPISuccessResponse.swift
//
//
//  Created by Reddy on 23/08/24.
//

import Foundation

public struct ProvisionAPISuccessResponse:Codable{
    public var credential: ProvisioningCredential?

    public init(){
        self.credential = ProvisioningCredential()
    }

    public init(credential:ProvisioningCredential){
        self.credential = credential
    }
}

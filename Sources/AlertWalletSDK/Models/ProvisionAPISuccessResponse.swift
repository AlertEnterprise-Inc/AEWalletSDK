//
//  ProvisionAPISuccessResponse.swift
//
//
//  Created by Reddy on 23/08/24.
//

import Foundation

public struct ProvisionAPISuccessResponse:Codable{
    public var credential: ProvisioningCredential?

    init(){
        self.credential = ProvisioningCredential()
    }

    init(credential:ProvisioningCredential){
        self.credential = credential
    }
}

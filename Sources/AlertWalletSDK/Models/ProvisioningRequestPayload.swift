//
//  ProvisioningContext.swift
//  
//
//  Created by Reddy on 23/08/24.
//
import Foundation

public struct ProvisioningRequestPayload: Codable {
    var identityId: String
    var identityMobileCredentialId: String
}

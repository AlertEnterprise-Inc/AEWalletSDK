//
//  ProvisioningInformation.swift
//  
//
//  Created by Reddy on 23/08/24.
//

import Foundation

public struct ProvisioningInformation: Codable {
    var provisioningCredentialIdentifier: String
    var sharingInstanceIdentifier: String
    var cardTemplateIdentifier: String
    var environmentIdentifier: String?
    var accountHash: String?
    var relyingPartyIdentifier: String?
}

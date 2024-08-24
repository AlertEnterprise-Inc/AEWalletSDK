//
//  ProvisioningInformation.swift
//
//
//  Created by Reddy on 23/08/24.
//

import Foundation

public struct ProvisioningInformation: Codable {
    public  var provisioningCredentialIdentifier: String
    public  var sharingInstanceIdentifier: String
    public var cardTemplateIdentifier: String
    public var environmentIdentifier: String?
    public var accountHash: String?
    public var relyingPartyIdentifier: String?
}

//
//  ProvisioningInformation.swift
//
//
//  Created by Reddy on 23/08/24.
//

import Foundation

public struct ProvisioningInformation: Codable {
    public var provisioningCredentialIdentifier: String
    public var sharingInstanceIdentifier: String
    public var cardTemplateIdentifier: String
    public var environmentIdentifier: String?
    public var accountHash: String?
    public var relyingPartyIdentifier: String?

    init(){
        self.provisioningCredentialIdentifier = ""
        self.sharingInstanceIdentifier = ""
        self.cardTemplateIdentifier = ""
        self.environmentIdentifier = nil
        self.accountHash = nil
        self.relyingPartyIdentifier = nil
    }
    init(provisioningCredentialIdentifier: String,
         sharingInstanceIdentifier: String,
         cardTemplateIdentifier: String,
         environmentIdentifier: String?,
         accountHash: String?,
         relyingPartyIdentifier: String?){
        self.provisioningCredentialIdentifier = provisioningCredentialIdentifier
        self.sharingInstanceIdentifier = sharingInstanceIdentifier
        self.cardTemplateIdentifier = cardTemplateIdentifier
        self.environmentIdentifier = environmentIdentifier
        self.accountHash = accountHash
        self.relyingPartyIdentifier = relyingPartyIdentifier
    }
}

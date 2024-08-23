//
//  ProvisioningContext.swift
//  
//
//  Created by Reddy on 23/08/24.
//
import Foundation

public struct ProvisioningContext: Codable {
    var employeeId: String?
    var propertyId: String?
    var reservationId: String?

    var product: String
    var credentialType: String?
    var cardTemplateIdentifier: String?
    var passDefinitionIdentifier: String?

    init(identityId:String?, identityMobileCredentialId: String?, product: String, credentialType: String?, cardTemplateIdentifier: String?, passDefinitionIdentifier: String?) {
        self.employeeId = identityId
        self.propertyId = identityMobileCredentialId
        self.product = product
        self.credentialType = credentialType
        self.cardTemplateIdentifier = cardTemplateIdentifier
        self.passDefinitionIdentifier = passDefinitionIdentifier
    }

    func toJSON() -> Data? {
        return try? JSONEncoder().encode(self)
    }
}

//
//  ProvisioningContext.swift
//
//
//  Created by Reddy on 23/08/24.
//
import Foundation

public struct ProvisioningRequestPayload: Codable {
    var userId: String
    var badgeId: String

    init(){
        self.userId = ""
        self.badgeId = ""
    }

    init(userId:String, badgeId:String){
        self.userId = userId
        self.badgeId = badgeId
    }
}

//
//  ProvisionAPIResponse.swift
//  
//
//  Created by Reddy on 23/08/24.
//

import Foundation
public struct ProvisionAPIResponse:Codable{
    public let success:Bool
    public let data : ProvisioningInformation!
    public let numberOfElements : Int
    public let totalPages : Int
    public let totalElements : Int
    public let pageNumber : Int
    public let pageSize : Int

    init(){
        self.success = false
        self.data = nil
        self.numberOfElements = 0
        self.totalPages = 0
        self.totalElements = 0
        self.pageNumber = 0
        self.pageSize = 0
    }
}

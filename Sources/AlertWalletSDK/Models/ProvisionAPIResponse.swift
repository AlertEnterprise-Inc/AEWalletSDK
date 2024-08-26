//
//  ProvisionAPIResponse.swift
//  
//
//  Created by Reddy on 23/08/24.
//

import Foundation
public struct ProvisionAPIResponse:Codable{
    let success:Bool
    let data : ProvisioningInformation!
    let numberOfElements : Int
    let totalPages : Int
    let totalElements : Int
    let pageNumber : Int
    let pageSize : Int

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

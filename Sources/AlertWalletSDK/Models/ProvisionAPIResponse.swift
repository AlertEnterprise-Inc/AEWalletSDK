//
//  ProvisionAPIResponse.swift
//  
//
//  Created by Reddy on 23/08/24.
//

import Foundation
struct ProvisionAPIResponse:Codable{
    let success:Bool
    let data : ProvisioningInformation!
    let numberOfElements : Int
    let totalPages : Int
    let totalElements : Int
    let pageNumber : Int
    let pageSize : Int
}

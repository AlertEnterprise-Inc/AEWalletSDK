//
//  ProvisionAPIResponse.swift
//
//
//  Created by Reddy on 23/08/24.
//

import Foundation
public struct ProvisionAPIResponse:Codable{
    public var success:Bool
    public var data : ProvisioningInformation!
    public var numberOfElements : Int
    public var totalPages : Int
    public var totalElements : Int
    public var pageNumber : Int
    public var pageSize : Int

    public init(){
        self.success = false
        self.data = nil
        self.numberOfElements = 0
        self.totalPages = 0
        self.totalElements = 0
        self.pageNumber = 0
        self.pageSize = 0
    }

    public init(success:Bool,
         data : ProvisioningInformation!,
         numberOfElements : Int,
         totalPages : Int,
         totalElements : Int,
         pageNumber : Int,
         pageSize : Int){
        self.success = success
        self.data = data
        self.numberOfElements = numberOfElements
        self.totalPages = totalPages
        self.totalElements = totalElements
        self.pageNumber = pageNumber
        self.pageSize = pageSize
    }
}

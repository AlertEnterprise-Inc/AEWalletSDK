//
//  ProvisionAPIErrorResponse.swift
//  
//
//  Created by Reddy on 23/08/24.
//

import Foundation
public struct ProvisionAPIErrorResponse :Error ,Codable {
    var error: String?
}

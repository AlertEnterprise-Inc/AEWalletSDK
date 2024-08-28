//
//  WalletProvisioningResponse.swift
//
//
//  Created by Reddy on 28/08/24.
//

import Foundation
import PassKit

public struct WalletProvisioningResponse: Codable {

    public var success : Bool
    public var passUrl : URL?
    public var message : String?
    public var pass : PassInformation

    public init(){
        self.success = false
        self.passUrl = nil
        self.message = nil
        self.pass  = PassInformation()
    }
    public init(message: String){
        self.success = false
        self.passUrl = nil
        self.message = message
        self.pass  = PassInformation()
    }
    public init(success:Bool, passUrl: URL? , message: String , pass: PassInformation){
        self.success = success
        self.passUrl = passUrl
        self.message = message
        self.pass  = pass
    }
}

public struct PassInformation: Codable{

    public var passType : Int?
    public var passTypeIdentifier : String?
    public var webServiceURL : URL?

    public init(){
        self.passType = nil
        self.passTypeIdentifier = nil
        self.webServiceURL = nil
    }

    public init(passType: Int? ,passTypeIdentifier: String? , webServiceURL: URL?){
        self.passType = passType
        self.passTypeIdentifier = passTypeIdentifier
        self.webServiceURL = webServiceURL
    }
}

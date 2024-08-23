//
//  Constants.swift
//  
//
//  Created by Reddy on 23/08/24.
//

import Foundation

enum Constants {
    enum API {
        static let PROV_WITH_PASS_IDENTIFIER="%1$@/api/mobile/%2$@/prepareProvisioning/pass/%3$@"
        static let PROV_WITHOUT_PASS_IDENTIFIER="%1$@/partner/v1/prepareProvisioning"
    }
    static let HEADER_KEY_ACCEPT = "Accept"
    static let HEADER_KEY_AUTHORIZATION = "Authorization"
    static let HEADER_KEY_CONTENT_TYPE = "Content-Type"
    static let HEADER_VALUE_CONTENT_TYPE_JSON = "application/json"
    static let HEADER_KEY_AUTHORIZATION_PREFIX = "Bearer "
    static let HTTP_POST = "POST"
    static let HTTP_GET = "GET"
    static let HEADER_KEY_X_REQUEST_ID = "x-requestId"
    static let HEADER_KEY_CACHE_CONTROL = "Cache-Control"
    static let HEADER_VALUE_NO_CACHE = "no-cache"
    
}


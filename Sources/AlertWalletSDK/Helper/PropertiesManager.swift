//
//  File.swift
//  
//
//  Created by Reddy on 22/08/24.
//

import Foundation
public class PropertiesManager {

    public static let shared = PropertiesManager()

    private let credentialTypeKeySuffix = "-credential-type"
    private let cardTemplateKeySuffix = "-cardTemplate-identifier"
    private let passPhotoKeySuffix = "pass-photo"
    private let authTokenSuffix = "-auth-token"
    private let authTokenExpirationSuffix = "-auth-token-expiration"
    private let serverUrlSuffix = "-serverUrl"
    private let serverPortSuffix = "-serverPort"

    private let defaults = UserDefaults.standard

   public func setServerURL(serverURL: String) {
        defaults.setValue(serverURL, forKey: serverUrlSuffix)
    }

    public func getServerURL() -> String? {
        if let serverURL = defaults.string(forKey: serverUrlSuffix) {
            return serverURL
        }
        return nil
    }

    public func getAccessToken() -> String? {
        if let accessToken = defaults.string(forKey: authTokenSuffix) {
            return accessToken
        }
        return nil
    }

    public func setAccessToken(authToken: String) {
        defaults.setValue(authToken, forKey: authTokenSuffix)
    }

    public func getAccessTokenExpiration()-> Double? {
        let accessTokenExpiration = defaults.double(forKey: authTokenExpirationSuffix)
        if (accessTokenExpiration > 0) {
            return accessTokenExpiration
        }
        return nil
    }

    public func setAccessTokenExpiration(accessTokenExpiration: Double) {
        defaults.setValue(accessTokenExpiration, forKey: authTokenExpirationSuffix)
    }

}

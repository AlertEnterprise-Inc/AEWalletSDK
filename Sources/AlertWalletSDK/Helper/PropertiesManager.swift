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

    func setServerURL(serverURL: String) {
        defaults.setValue(serverURL, forKey: serverUrlSuffix)
    }

    func getServerURL() -> String? {
        if let serverURL = defaults.string(forKey: serverUrlSuffix) {
            return serverURL
        }
        return nil
    }

    func getAccessToken() -> String? {
        if let accessToken = defaults.string(forKey: authTokenSuffix) {
            return accessToken
        }
        return nil
    }

    func setAccessToken(authToken: String) {
        defaults.setValue(authToken, forKey: authTokenSuffix)
    }

    func getAccessTokenExpiration()-> Double? {
        let accessTokenExpiration = defaults.double(forKey: authTokenExpirationSuffix)
        if (accessTokenExpiration > 0) {
            return accessTokenExpiration
        }
        return nil
    }

    func setAccessTokenExpiration(accessTokenExpiration: Double) {
        defaults.setValue(accessTokenExpiration, forKey: authTokenExpirationSuffix)
    }

}

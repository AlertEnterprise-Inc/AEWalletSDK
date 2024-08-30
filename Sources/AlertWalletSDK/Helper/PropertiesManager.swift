//
//  PropertiesManager.swift
//
//
//  Created by Reddy on 22/08/24.
//

import Foundation
public class PropertiesManager {

    public static let shared = PropertiesManager()


    private let authTokenKey = "alert-sdk-auth-token"
    private let serverUrlKey = "alert-sdk-serverUrl"
    private let environmentIdentifierKey = "alert-sdk-cardTemplate-identifier"
    private let ownerNameKey = "alert-sdk-pass-owner-name"
    private let passDescriptionKey = "alert-sdk-pass-preview-description"
    private let appleWalletViewDismissTimeout = "alert-sdk-wallet-time-out"

    private let defaults = UserDefaults.standard

    public func setServerURL(serverURL: String) {
        defaults.setValue(serverURL, forKey: serverUrlKey)
    }
    public func getServerURL() -> String? {
        if let serverURL = defaults.string(forKey: serverUrlKey) {
            return serverURL
        }
        return nil
    }
    public func clearServerURL() -> Void {
        UserDefaults.standard.removeObject(forKey: serverUrlKey)
    }
    public func getAccessToken() -> String? {
        if let accessToken = defaults.string(forKey: authTokenKey) {
            return accessToken
        }
        return nil
    }
    public func setAccessToken(authToken: String) {
        defaults.setValue(authToken, forKey: authTokenKey)
    }
    public func clearAccessToken() -> Void {
        UserDefaults.standard.removeObject(forKey: authTokenKey)
    }
    public func getEnvironmentIdentifier() -> String? {
        if let environmentIdentifier = defaults.string(forKey: environmentIdentifierKey) {
            return environmentIdentifier
        }
        return nil
    }
    public func setEnvironmentIdentifier(environmentIdentifier: String) {
        defaults.setValue(environmentIdentifier, forKey: environmentIdentifierKey)
    }
    public func clearEnvironmentIdentifier() -> Void {
        UserDefaults.standard.removeObject(forKey: environmentIdentifierKey)
    }
    public func getOwnerName() -> String? {
        if let ownerName = defaults.string(forKey: ownerNameKey) {
            return ownerName
        }
        return nil
    }
    public func setOwnerName(ownerName: String) {
        defaults.setValue(ownerName, forKey: ownerNameKey)
    }
    public func clearOwnerName() -> Void {
        UserDefaults.standard.removeObject(forKey: ownerNameKey)
    }
    public func getPassDescription() -> String? {
        if let passDescription = defaults.string(forKey: passDescriptionKey) {
            return passDescription
        }
        return nil
    }
    public func setPassDescription(passDescription: String) {
        defaults.setValue(passDescription, forKey: passDescriptionKey)
    }
    public func clearPassDescription() -> Void {
        UserDefaults.standard.removeObject(forKey: passDescriptionKey)
    }

    public func getAppleWalletUITimeout() -> Int {
        if let passDescription = defaults.string(forKey: appleWalletViewDismissTimeout) {
            return Int(passDescription)!
        }
        return -1
    }
    public func setAppleWalletViewDismissTimeout(appleWalletViewDismissTimeout: String) {
        defaults.setValue(appleWalletViewDismissTimeout, forKey: appleWalletViewDismissTimeout)
    }
    public func clearAppleWalletViewDismissTimeout() -> Void {
        UserDefaults.standard.removeObject(forKey: appleWalletViewDismissTimeout)
    }

    public func clearAll() -> Void {
        clearAccessToken()
        clearServerURL()
        clearOwnerName()
        clearEnvironmentIdentifier()
        clearPassDescription()
        clearAppleWalletViewDismissTimeout()
    }

}

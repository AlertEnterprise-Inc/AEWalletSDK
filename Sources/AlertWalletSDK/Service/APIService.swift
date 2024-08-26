//
//  APIService.swift
//
//
//  Created by Reddy on 23/08/24.
//

import Foundation
import os

final class APIService{

    private static let logger = Logger(
        subsystem: Bundle.main.bundleIdentifier!,
        category: String(describing: APIService.self)
    )

    static let shared = APIService()

    func preparePass(payloadData: ProvisioningRequestPayload, withCompletion completion: @escaping (Result<ProvisionAPISuccessResponse,ProvisionAPIErrorResponse>) -> Void){
        Self.logger.info("APIService preparePass Begin")
        let endpoint =  String(format: Constants.API.PROV_WITHOUT_PASS_IDENTIFIER , PropertiesManager.shared.getServerURL()! )
        let _payload =  ["identityId": payloadData.userId, "identityMobileCredentialId": payloadData.badgeId]
        let payload = try? JSONEncoder().encode(_payload)
        Self.logger.debug("URL for preparePassProvisioning: \(endpoint)")
        let header = Constants.HEADER_KEY_AUTHORIZATION_PREFIX + PropertiesManager.shared.getAccessToken()!
        var request = URLRequest(url: URL(string: endpoint)!)
        request.httpMethod = Constants.HTTP_POST
        request.addValue(Constants.HEADER_VALUE_CONTENT_TYPE_JSON, forHTTPHeaderField: Constants.HEADER_KEY_CONTENT_TYPE)
        request.addValue(Constants.HEADER_VALUE_CONTENT_TYPE_JSON, forHTTPHeaderField: Constants.HEADER_KEY_ACCEPT)
        request.addValue(UUID().uuidString,  forHTTPHeaderField: Constants.HEADER_KEY_X_REQUEST_ID)
        request.addValue(header, forHTTPHeaderField: Constants.HEADER_KEY_AUTHORIZATION)
        request.addValue(Constants.HEADER_VALUE_NO_CACHE, forHTTPHeaderField: Constants.HEADER_KEY_CACHE_CONTROL)
        request.httpBody = payload
        request.cachePolicy = .reloadIgnoringLocalCacheData
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let httpResponse = response as? HTTPURLResponse {
                if(httpResponse.statusCode == 401) {
                    Self.logger.error("alertSDK APIService Server returned unauthorized error code")
                    completion(.failure(ProvisionAPIErrorResponse(error: "Server returned unauthorized error code")))
                    return
                }else if(httpResponse.statusCode != 200) {
                    Self.logger.error("alertSDK APIService  Server non-success code: \(httpResponse.statusCode)")
                    completion(.failure(ProvisionAPIErrorResponse(error: "Server returned non-success code")))
                    return
                }
                if let data = data {
                    let decoder = JSONDecoder()
                    let decoded = try? decoder.decode(ProvisionAPIResponse.self, from: data)
                    if decoded != nil {
                        let credential = ProvisioningCredential(provisioningInformation: decoded!.data)
                        completion(.success(ProvisionAPISuccessResponse(credential: credential)))
                    }
                }


                let error = error
                if (error != nil) {
                    completion(.failure(ProvisionAPIErrorResponse(error: error?.localizedDescription)))
                }
            }
        }.resume()
    }
}

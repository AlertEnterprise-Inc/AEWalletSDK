//
//  APIService.swift
//
//
//  Created by Reddy on 23/08/24.
//

import Foundation


final class APIService{

    static let shared = APIService()

    func preparePassProvisioning(_ context: ProvisioningContext, withCompletion completion: @escaping (Result<ProvisionAPISuccessResponse,ProvisionAPIErrorResponse>) -> Void){

     var endpoint = ""
        if(context.passDefinitionIdentifier != nil) {
            endpoint = String(format: Constants.API.PROV_WITH_PASS_IDENTIFIER , PropertiesManager.shared.getServerURL()! ,context.product, context.passDefinitionIdentifier!)
        } else {
            endpoint = String(format: Constants.API.PROV_WITHOUT_PASS_IDENTIFIER , PropertiesManager.shared.getServerURL()! )
        }
        let context =  ["identityId": "2", "identityMobileCredentialId": "1"]
        let payload = try? JSONEncoder().encode(context)
        NSLog("URL for preparePassProvisioning: \(endpoint)")

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
        var isSuccess = false;

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let httpResponse = response as? HTTPURLResponse {
                if(httpResponse.statusCode == 401) {
                    NSLog("Server returned unauthorized error code")
                    completion(.failure(ProvisionAPIErrorResponse(error: "Server returned unauthorized error code")))
                    return
                }else if(httpResponse.statusCode != 200) {
                    NSLog("Server non-success code: ", httpResponse.statusCode)
                    completion(.failure(ProvisionAPIErrorResponse(error: "Server returned non-success code")))
                    return
                }
                if let data = data {
                    let decoder = JSONDecoder()
                    let bodyString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) ?? "Can't render body; not utf8 encoded"
                    NSLog(bodyString as String)
                    NSLog(error.debugDescription as String)
                    let decoded = try? decoder.decode(ProvisionAPIResponse.self, from: data)


                    if decoded != nil {
                        let credential = ProvisioningCredential(provisioningInformation: decoded!.data)
                        print(credential.provisioningInformation.cardTemplateIdentifier)
                        completion(.success(ProvisionAPISuccessResponse(credential: credential)))
                    }
                }
            }
        }.resume()

    }

}

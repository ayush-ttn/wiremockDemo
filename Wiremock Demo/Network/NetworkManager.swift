//
//  NetworkManager.swift
//  Wiremock Demo
//
//  Created by Ayush Awasthi on 12/03/24.
//

import UIKit
import Alamofire

class NetworkManager: NSObject {
    enum Errors: Error {
        case requestFailed
    }
    static func hitAPI<ModelClass: Codable>(endpoint: Endpoints, completion: ((Result<ModelClass, Error>) -> Void)?) {
        AF.request(endpoint)
            .validate()
            .responseDecodable { (response: DataResponse<ModelClass, AFError>) in
                if let value = response.value {
                    completion?(.success(value))
                } else {
                    if let error = response.error {
                        completion?(.failure(error))
                    } else {
                        completion?(.failure(Errors.requestFailed))
                    }
                }
            }
    }
}

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
        var request = try! endpoint.asURLRequest()

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
//              completion?(.failure(error))
            return
          }
            do {
                let obj = try JSONDecoder().decode(ModelClass.self, from: data)
                completion?(.success(obj))
            } catch {
                completion?(.failure(error))
            }
        }

        task.resume()

    }
}

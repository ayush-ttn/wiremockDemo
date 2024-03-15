//
//  Endpoints.swift
//  Wiremock Demo
//
//  Created by Ayush Awasthi on 12/03/24.
//

import UIKit
import Alamofire

enum Endpoints: URLRequestConvertible {
    enum Errors: Error, CustomStringConvertible {
        case invalidURL
        var description: String {
            switch self {
            case .invalidURL:
                return "The url/parameters for this request is not correct"
            }
        }
    }
    case login(_ username: String, _ passwrod: String)
    case listProducts
    
    var baseURL: String {
        "dummyjson.com"
    }
    
    var endpoint: String {
        switch self {
        case .login:
            return "/auth/login"
        case .listProducts:
            return "/products"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        case .listProducts:
            return .get
        }
    }
    
    var params: [String: String]? {
        switch self {
        case .login(let username, let password):
            return ["username": username,
                    "password": password]
        case .listProducts:
            return nil
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        var components = URLComponents()
            components.scheme = "https"
            components.host = baseURL
            components.path = endpoint
        if let params, method == .get {
            components.queryItems = params.compactMap({URLQueryItem(name: $0.key, value: $0.value)})
        }
        guard let url = components.url else {
            throw Errors.invalidURL
        }
        var request = try URLRequest(url: url, method: method)
        request.method = method
        if method == .post, let params {
            let data = try? JSONSerialization.data(withJSONObject: params)
            request.httpBody = data
        }
        request.addValue("Content-Type", forHTTPHeaderField: "application/json")
        return request
    }
}

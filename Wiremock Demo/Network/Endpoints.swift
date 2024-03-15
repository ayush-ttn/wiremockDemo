//
//  Endpoints.swift
//  Wiremock Demo
//
//  Created by Ayush Awasthi on 12/03/24.
//

import UIKit
//import Alamofire

enum Endpoints {
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
        if StartupUtils.shouldRunLocal() {
            return "localhost"
        } else {
            return "dummyjson.com"
        }
    }
    
    var endpoint: String {
        switch self {
        case .login:
            return "/auth/login"
        case .listProducts:
            return "/products"
        }
    }
    
    var method: String {
        switch self {
        case .login:
            return "POST"
        case .listProducts:
            return "GET"
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
        if StartupUtils.shouldRunLocal() {
            components.scheme = "http"
            components.port = 9999
        } else {
            components.scheme = "https"
        }
        
        components.host = baseURL
        components.path = endpoint
        if let params {
            var queryItems = [URLQueryItem(name: "username", value: params["username"]), URLQueryItem(name: "password", value: params["password"])]
            components.queryItems = queryItems
            
//            components.queryItems = params.compactMap({URLQueryItem(name: $0.key, value: $0.value)})
        }
        guard let url = components.url else {
            throw Errors.invalidURL
        }
        var request = URLRequest(url: url)
        request.httpMethod = method
        if method == "POST" {
            request.httpBody = components.query?.data(using: .utf8)
        }
        return request
    }
}

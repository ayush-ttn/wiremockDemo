//
//  LoginViewModel.swift
//  Wiremock Demo
//
//  Created by Ayush Awasthi on 12/03/24.
//

import UIKit

class LoginViewModel: NSObject {
    func login(username: String, password: String, completion: ((Bool) -> Void)?) {
        NetworkManager.hitAPI(endpoint: .login(username, password)) { (result: Result<LoginResponse, Error>) in
            switch result {
            case .success(let success):
                completion?(true)
            case .failure(let failure):
                completion?(false)
            }
        }
    }
}

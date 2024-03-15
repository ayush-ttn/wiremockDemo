//
//  Models.swift
//  Wiremock Demo
//
//  Created by Ayush Awasthi on 12/03/24.
//

import UIKit

struct LoginResponse: Codable {
    let id: Int
    let username: String
    let email: String
    let firstName: String
    let lastName: String
    let image: String
    let gender: String
}

struct Product: Codable {
    let id: Int
    let title: String
    let description: String
    let price: Int
    let discountPercentage: Double
    let rating: Double
    let stock: Int
    let brand: String
    let category: String
    let thumbnail: String
}

struct ProductResponse: Codable {
    let products: [Product]
}
extension UIView {
    public func setAutomationId(_ id: String) {
        self.isAccessibilityElement     = true
        self.accessibilityIdentifier    = id
    }
}

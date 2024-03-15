//
//  ProductListViewModel.swift
//  Wiremock Demo
//
//  Created by Ayush Awasthi on 12/03/24.
//

import UIKit

class ProductListViewModel: NSObject {
    var reloadData: ((Bool) -> Void)?
    var products: [Product] = []
    func fetchProducts() {
        NetworkManager.hitAPI(endpoint: .listProducts) {[weak self] (result: Result<ProductResponse, Error>) in
            guard let self else {
                return
            }
            switch result {
            case .success(let success):
                self.products = success.products
                self.reloadData?(true)
            case .failure(let failure):
                self.reloadData?(false)
            }
        }
    }
    
    var numberOfRows: Int {
        return products.count
    }
    
    var numberOfSections: Int {
        products.isEmpty ? 0 : 1
    }
    
    func product(at indexPath: IndexPath) -> Product? {
        guard indexPath.row < products.count else {
            return nil
        }
        return products[indexPath.row]
    }
}

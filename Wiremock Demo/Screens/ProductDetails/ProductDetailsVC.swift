//
//  ProductDetailsVC.swift
//  Wiremock Demo
//
//  Created by Ayush Awasthi on 15/03/24.
//

import UIKit

class ProductDetailsVC: UIViewController {
    var product: Product?
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var thumbImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let product else {
            fatalError("No product to show details")
        }
        titleLabel.text = product.title
        descriptionLabel.text = product.description
        priceLabel.text = "$\(product.price)"
        if let url = URL(string: product.thumbnail) {
//            thumbImageView.af.setImage(withURL: url)
        }
    }

}

//
//  ProductListVC.swift
//  Wiremock Demo
//
//  Created by Ayush Awasthi on 12/03/24.
//

import UIKit
import MBProgressHUD

class ProductListVC: UIViewController {
    @IBOutlet var tableView: UITableView!
    var viewModel = ProductListViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.reloadData = {[weak self] isSuccess in
            self?.reloadData(success: isSuccess)
        }
        MBProgressHUD.showAdded(to: self.view, animated: true)
        viewModel.fetchProducts()
    }
    
    func reloadData(success: Bool) {
        MBProgressHUD.hide(for: self.view, animated: true)
        if success {
            tableView.reloadData()
        } else {
            let alert = UIAlertController(title: "Error", message: "Unable to fetch data", preferredStyle: .alert)
            let okBtn = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okBtn)
            present(alert, animated: true)
        }
    }
}
extension ProductListVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSections
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductCell
        guard let product = viewModel.product(at: indexPath) else {
            return cell
        }
        cell.show(product: product)
        return cell
    }
    
}

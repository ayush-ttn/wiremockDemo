//
//  SettingsVc.swift
//  Wiremock Demo
//
//  Created by Ayush Awasthi on 15/03/24.
//

import UIKit

class SettingsVc: UIViewController {
    @IBOutlet var logoutButton: UIButton! {
        didSet {
            logoutButton.setAutomationId("logout")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func logouTapped() {
        let vm = LoginViewModel()
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "LoginVC") { coder in
            return LoginVC(viewModel: vm, coder: coder)
        }
        window?.rootViewController = vc
    }
    
}

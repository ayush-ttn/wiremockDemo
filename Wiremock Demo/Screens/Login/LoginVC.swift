//
//  LoginVC.swift
//  Wiremock Demo
//
//  Created by Ayush Awasthi on 12/03/24.
//

import UIKit
import MBProgressHUD

class LoginVC: UIViewController {
    @IBOutlet var usernameTextField: UITextField! {
        didSet {
            usernameTextField.setAutomationId("username")
        }
    }
    @IBOutlet var passwordTextField: UITextField! {
        didSet {
            passwordTextField.setAutomationId("password")
        }
    }
    
    @IBOutlet var submitButton: UIButton! {
        didSet {
            submitButton.setAutomationId("submit")
        }
    }
    
    let viewModel: LoginViewModel
    init?(viewModel: LoginViewModel, coder: NSCoder) {
        self.viewModel = viewModel
        super.init(coder: coder)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func submitTapped() {
        guard let username = usernameTextField.text, !username.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
                  let alert = UIAlertController(title: "Error", message: "Enter valid username and password", preferredStyle: .alert)
                  let okBtn = UIAlertAction(title: "OK", style: .default)
                  alert.addAction(okBtn)
                  present(alert, animated: true)
            return
        }
        MBProgressHUD.showAdded(to: self.view, animated: true)
        viewModel.login(username: username, password: password) { isSuccess in
            DispatchQueue.main.async {
                MBProgressHUD.hide(for: self.view, animated: true)
                if isSuccess {
                    UserDefaults.standard.setValue(true, forKey: "loggedIn")
                    let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "TabbarVC")
                    self.window?.rootViewController = vc
                } else {
                    let alert = UIAlertController(title: "Error", message: "Login failed!", preferredStyle: .alert)
                    let okBtn = UIAlertAction(title: "OK", style: .default)
                    alert.addAction(okBtn)
                    self.present(alert, animated: true)
                }
            }
        }
    }
}

//
//  ViewController.swift
//  ViewCodeDescomplicado
//
//  Created by Sillas Santos on 11/06/23.
//

import UIKit


class LoginViewController: UIViewController {
    
    var loginScreen: LoginScreen?
    
    override func loadView() {
        loginScreen = LoginScreen()
        view = loginScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginScreen?.configTextFieldDelegate(delegate: self)
        loginScreen?.delegate(delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

extension LoginViewController: LoginScreenProtocol {
    
    func actionLoginButton() {
        // Action
    }
    
    func actionRegisterButton() {
        let vc: RegisterViewController = RegisterViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
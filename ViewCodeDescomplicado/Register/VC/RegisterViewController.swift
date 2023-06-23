//
//  RegisterViewController.swift
//  ViewCodeDescomplicado
//
//  Created by Sillas Santos on 19/06/23.
//

import UIKit

class RegisterViewController: UIViewController {
    
    var registerScreen: RegisterScreen?
    
    override func loadView() {
        registerScreen = RegisterScreen()
        view = registerScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerScreen?.configTextFieldDelegate(delegate: self)
        registerScreen?.delegate(delegate: self)
    }
}

extension RegisterViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension RegisterViewController: RegisterScreenProtocol {
    
    func actionBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    func actionRegisterButton() {
        print("Chegou register button")
    }
}
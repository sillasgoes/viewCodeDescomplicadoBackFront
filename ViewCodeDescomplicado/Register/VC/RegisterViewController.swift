//
//  RegisterViewController.swift
//  ViewCodeDescomplicado
//
//  Created by Sillas Santos on 19/06/23.
//

import UIKit

class RegisterViewController: UIViewController {

     var registerScreen: RegisterView?
    
    override func loadView() {
        let registerView = RegisterView()
        self.view = registerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerScreen?.configTextFieldDelegate(delegate: self)
    }
}

extension RegisterViewController: UITextFieldDelegate {
    
}

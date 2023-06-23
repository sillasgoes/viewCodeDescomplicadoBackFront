//
//  RegisterView.swift
//  ViewCodeDescomplicado
//
//  Created by Sillas Santos on 19/06/23.
//

import UIKit

class RegisterView: UIView {
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "arrowshape.backward.fill"), for: .normal)
        button.tintColor = UIColor(red: 3/255, green: 58/255, blue: 51/255, alpha: 1.0)
        return button
    }()
    
    lazy var imageAddUser: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "person.crop.circle.fill.badge.plus")
        image.contentMode = .scaleAspectFit
        image.tintColor = UIColor(red: 3/255, green: 58/255, blue: 51/255, alpha: 1.0)
        return image
    }()
    
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress
        tf.placeholder = "Digite seu email"
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.layer.cornerRadius = 7.5
        tf.layer.borderWidth = 1
        tf.layer.borderColor =  UIColor(red: 3/255, green: 58/255, blue: 51/255, alpha: 1.0).cgColor
        tf.textColor = .darkGray
        return tf
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.placeholder = "Digite sua Senha"
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.layer.cornerRadius = 7.5
        tf.layer.borderWidth = 1
        tf.layer.borderColor =  UIColor(red: 3/255, green: 58/255, blue: 51/255, alpha: 1.0).cgColor
        tf.textColor = .darkGray
        tf.isSecureTextEntry = true
        return tf
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastrar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.backgroundColor = UIColor(red: 3/255, green: 58/255, blue: 51/255, alpha: 1.0)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupView()
        setupConstraints()
    }
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate) {
        emailTextField.delegate = delegate
        passwordTextField.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error")
    }
    
    private func setupView() {
        addSubview(imageAddUser)
        addSubview(backButton)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(registerButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageAddUser.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            imageAddUser.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageAddUser.widthAnchor.constraint(equalToConstant: 150),
            imageAddUser.heightAnchor.constraint(equalToConstant: 150),
            
            backButton.topAnchor.constraint(equalTo: imageAddUser.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            emailTextField.topAnchor.constraint(equalTo: imageAddUser.bottomAnchor, constant: 30),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 60
                                                  ),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            registerButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            registerButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            registerButton.heightAnchor.constraint(equalToConstant: 40),
            
        ])
    }
}

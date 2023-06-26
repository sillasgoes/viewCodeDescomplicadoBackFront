//
//  RegisterView.swift
//  ViewCodeDescomplicado
//
//  Created by Sillas Santos on 19/06/23.
//

import UIKit

enum typeAction {
    case success
    case failure
}

protocol RegisterScreenProtocol: AnyObject {
    func actionBackButton()
    func actionRegisterButton(_ type: typeAction)
}

class RegisterScreen: UIView {
    
    weak private var delegate: RegisterScreenProtocol?
    
    func delegate(delegate: RegisterScreenProtocol) {
        self.delegate = delegate
    }
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "arrowshape.backward.fill"), for: .normal)
        button.tintColor = UIColor(red: 3/255, green: 58/255, blue: 51/255, alpha: 1.0)
        button.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
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
        button.addTarget(self, action: #selector(tappedRegisterButton), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupView()
        configConstraints()
    }
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate) {
        emailTextField.delegate = delegate
        passwordTextField.delegate = delegate
    }
    
    @objc func tappedBackButton() {
        delegate?.actionBackButton()
    }
    
    @objc func tappedRegisterButton() {
        
        guard Utils.Email.validate(email: emailTextField.text, password: passwordTextField.text) else {
            delegate?.actionRegisterButton(.failure)
            return
        }
        delegate?.actionRegisterButton(.success)
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
//
//    private func setupConstraints() {
//        NSLayoutConstraint.activate([
//            imageAddUser.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
//            imageAddUser.centerXAnchor.constraint(equalTo: centerXAnchor),
//            imageAddUser.widthAnchor.constraint(equalToConstant: 150),
//            imageAddUser.heightAnchor.constraint(equalToConstant: 150),
//
//            backButton.topAnchor.constraint(equalTo: imageAddUser.topAnchor),
//            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
//
//            emailTextField.topAnchor.constraint(equalTo: imageAddUser.bottomAnchor, constant: 30),
//            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
//            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
//            emailTextField.heightAnchor.constraint(equalToConstant: 40),
//
//            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 60
//                                                  ),
//            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
//            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
//            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
//
//            registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
//            registerButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
//            registerButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
//            registerButton.heightAnchor.constraint(equalToConstant: 40),
//
//        ])
//    }
    
    // MARK: - SnapKit funcs
    
    func configConstraints() {
        configImageAddUserConstraints()
        configBackButtonConstraints()
        configEmailTextFieldConstraints()
        configPasswordTextFieldConstraints()
        configRegisterButtonConstraints()
    }
    
    func configImageAddUserConstraints() {
        imageAddUser.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(150)
            make.height.equalTo(150)
        }
        
    }
    
    func configBackButtonConstraints() {
        backButton.snp.makeConstraints { make in
            make.top.equalTo(imageAddUser.snp.top)
            make.leading.equalTo(20)
        }
    }
    
    func configEmailTextFieldConstraints() {
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(imageAddUser.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().inset(15)
            make.height.equalTo(40)
        }
    }
    
    func configPasswordTextFieldConstraints() {
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().inset(15)
            make.height.equalTo(40)
        }
    }
    
    func configRegisterButtonConstraints() {
        registerButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().inset(30)
            make.height.equalTo(40)
        }
    }
}

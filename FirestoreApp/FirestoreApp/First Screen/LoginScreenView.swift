//
//  LoginScreenView.swift
//  FirestoreApp
//
//  Created by Jiali Han on 11/5/24.
//

import UIKit

class LoginScreenView: UIView {
    var loginLabel: UILabel!;
    var emailFeild: UITextField!;
    var pwFeild: UITextField!;
    
    var loginButton: UIButton!;
    var registerButton: UIButton!;
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
            
        setloginLabel()
        setemailFeild()
        setpwFeild()
        
        setloginButton()
        setregisterButton()
        
        initConstraints()
    }
    
    func setloginLabel() {
        loginLabel = UILabel()
        loginLabel.text = "Login your account"
        loginLabel.font = .boldSystemFont(ofSize: 24)
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(loginLabel)
    }
    
    func setemailFeild() {
        emailFeild = UITextField()
        emailFeild.font = UIFont.systemFont(ofSize: 20);
        emailFeild.placeholder = "Email"
        emailFeild.borderStyle = .roundedRect
        emailFeild.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(emailFeild)
    }
    
    func setpwFeild() {
        pwFeild = UITextField()
        pwFeild.font = UIFont.systemFont(ofSize: 20);
        pwFeild.placeholder = "Password"
        pwFeild.borderStyle = .roundedRect
        pwFeild.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(pwFeild)
    }
     
    
    func setloginButton() {
        loginButton = UIButton(type: .system)
        loginButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        loginButton.setTitle("Sign in", for: .normal)
        loginButton.configuration = .filled()
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(loginButton)
    }
    
    func setregisterButton() {
        registerButton = UIButton(type: .system)
        registerButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        registerButton.setTitle("Register", for: .normal)
        registerButton.configuration = .gray()
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(registerButton)
    }
    
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            //bottom add view...
            
            loginLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 64),
            loginLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            
            emailFeild.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 24),
            emailFeild.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 28),
            emailFeild.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -28),
            
            pwFeild.topAnchor.constraint(equalTo: emailFeild.bottomAnchor, constant: 24),
            pwFeild.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 28),
            pwFeild.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -28),
            
            registerButton.topAnchor.constraint(equalTo: pwFeild.bottomAnchor, constant: 24),
            registerButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 28),
            registerButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor, constant: -14),
            
            loginButton.topAnchor.constraint(equalTo: pwFeild.bottomAnchor, constant: 24),
            loginButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor, constant: 14),
            loginButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -28),
        ])
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}

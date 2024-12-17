//
//  RegisterView.swift
//  FirestoreApp
//
//  Created by Jiali Han on 11/5/24.
//

import UIKit

class RegisterView: UIView {
    var loginLabel: UILabel!;
    
    var emailFeild: UITextField!;
    var pwFeild: UITextField!;
    var nameFeild: UITextField!;
    
    var signUpButton: UIButton!;
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
            
        setloginLabel()
        
        setemailFeild()
        setpwFeild()
        setnameFeild()
        
        setloginButton()
        
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
    
    func setnameFeild() {
        nameFeild = UITextField()
        nameFeild.font = UIFont.systemFont(ofSize: 20);
        nameFeild.placeholder = "Name"
        nameFeild.borderStyle = .roundedRect
        nameFeild.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(nameFeild)
    }
     
    
    func setloginButton() {
        signUpButton = UIButton(type: .system)
        signUpButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.configuration = .filled()
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(signUpButton)
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
            
            nameFeild.topAnchor.constraint(equalTo: pwFeild.bottomAnchor, constant: 24),
            nameFeild.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 28),
            nameFeild.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -28),
            
            signUpButton.topAnchor.constraint(equalTo: nameFeild.bottomAnchor, constant: 24),
            signUpButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor, constant: 14),
            signUpButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -28),
        ])
    }
    
    
    //MARK: initializing constraints...
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

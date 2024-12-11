//
//  RegisterPageView.swift
//  WA7_Han_4385
//
//  Created by Jiali Han on 10/29/24.
//

import UIKit

class RegisterPageView: UIView {

    var labelCreateAccount: UILabel!;
    
    var textFieldEmail: UITextField!;
    var textFieldPassword: UITextField!;
    var textFieldName: UITextField!;
    
    var buttonSignUp: UIButton!;
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
            
        setLabelCreateAccount()
        
        setTextFieldEmail()
        setTextFieldPassword()
        setTextFieldName()
        
        setButtonSignUp()
        
        initConstraints()
    }
    
    func setLabelCreateAccount() {
        labelCreateAccount = UILabel()
        labelCreateAccount.text = "Create Account"
        labelCreateAccount.font = .boldSystemFont(ofSize: 30)
        labelCreateAccount.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelCreateAccount)
    }
    
    func setTextFieldEmail() {
        textFieldEmail = UITextField()
        textFieldEmail.font = UIFont.systemFont(ofSize: 20);
        textFieldEmail.placeholder = "Email"
        textFieldEmail.borderStyle = .roundedRect
        textFieldEmail.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldEmail)
    }
    
    func setTextFieldPassword() {
        textFieldPassword = UITextField()
        textFieldPassword.font = UIFont.systemFont(ofSize: 20);
        textFieldPassword.placeholder = "Password"
        textFieldPassword.borderStyle = .roundedRect
        textFieldPassword.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldPassword)
    }
    
    func setTextFieldName() {
        textFieldName = UITextField()
        textFieldName.font = UIFont.systemFont(ofSize: 20);
        textFieldName.placeholder = "Name"
        textFieldName.borderStyle = .roundedRect
        textFieldName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldName)
    }
     
    
    func setButtonSignUp() {
        buttonSignUp = UIButton(type: .system)
        buttonSignUp.titleLabel?.font = .boldSystemFont(ofSize: 20)
        buttonSignUp.setTitle("Sign Up", for: .normal)
        buttonSignUp.configuration = .filled()
        buttonSignUp.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonSignUp)
    }
    
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            labelCreateAccount.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 64),
            labelCreateAccount.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            
            textFieldEmail.topAnchor.constraint(equalTo: labelCreateAccount.bottomAnchor, constant: 30),
            textFieldEmail.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 28),
            textFieldEmail.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -28),
            
            textFieldPassword.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 24),
            textFieldPassword.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 28),
            textFieldPassword.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -28),
            
            textFieldName.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor, constant: 24),
            textFieldName.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 28),
            textFieldName.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -28),
            
            buttonSignUp.widthAnchor.constraint(equalToConstant: 300),
            buttonSignUp.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: 30),
            buttonSignUp.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
        ])
    }
    
    
    //MARK: initializing constraints...
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}


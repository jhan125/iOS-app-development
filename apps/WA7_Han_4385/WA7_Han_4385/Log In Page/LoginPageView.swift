//
//  LoginPageView.swift
//  WA7_Han_4385
//
//  Created by Jiali Han on 10/29/24.
//

import UIKit

class LoginPageView: UIView {
    
    var labelLoginTitle: UILabel!
    var labelLoginDescription: UILabel!
    
    var textFieldEmail: UITextField!
    var textFieldPassword: UITextField!
    
    var buttonSignIn: UIButton!
    
    var labelSignUpDescription: UILabel!
    var buttonSignUp: UIButton!
    
    var bottomStackView: UIStackView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
            
        setLabelLoginTitle()
        setLabelLoginDescription()
        
        setTextFieldEmail()
        setTextFieldPassword()
        
        setButtonSignIn()
        
        setLabelSignUpDescription()
        setButtonSignUp()
        
        setBottomStackView()
        
        initConstraints()
    }
    
    func setLabelLoginTitle() {
        labelLoginTitle = UILabel()
        labelLoginTitle.text = "Login"
        labelLoginTitle.font = .boldSystemFont(ofSize: 30)
        labelLoginTitle.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelLoginTitle)
    }
    
    func setLabelLoginDescription() {
        labelLoginDescription = UILabel()
        labelLoginDescription.text = "Please sign in to continue."
        labelLoginDescription.font = .boldSystemFont(ofSize: 20)
        labelLoginDescription.textColor = UIColor.lightGray
        labelLoginDescription.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelLoginDescription)
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
    
    func setButtonSignIn() {
        buttonSignIn = UIButton(type: .system)
        buttonSignIn.titleLabel?.font = .boldSystemFont(ofSize: 20)
        buttonSignIn.setTitle("Sign in", for: .normal)
        buttonSignIn.configuration = .filled()
        buttonSignIn.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonSignIn)
    }
    
    func setLabelSignUpDescription() {
        labelSignUpDescription = UILabel()
        labelSignUpDescription.text = "Don't have an account? "
        labelSignUpDescription.font = .boldSystemFont(ofSize: 20)
        labelSignUpDescription.textColor = UIColor.lightGray
        labelSignUpDescription.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelSignUpDescription)
    }
    
    func setButtonSignUp() {
        buttonSignUp = UIButton(type: .system)
        buttonSignUp.titleLabel?.font = .boldSystemFont(ofSize: 20)
        buttonSignUp.setTitle("Sign up", for: .normal)
        buttonSignUp.setTitleColor(.systemBlue, for: .normal)
        buttonSignUp.backgroundColor = .clear
        buttonSignUp.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonSignUp)
    }
    
    func setBottomStackView() {
        bottomStackView = UIStackView(arrangedSubviews: [labelSignUpDescription, buttonSignUp])
        bottomStackView.axis = .horizontal
        bottomStackView.alignment = .center
        bottomStackView.spacing = 8 // Space between label and button
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false

        self.addSubview(bottomStackView)
    }
    
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            labelLoginTitle.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 64),
            labelLoginTitle.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            
            labelLoginDescription.topAnchor.constraint(equalTo: labelLoginTitle.bottomAnchor, constant: 18),
            labelLoginDescription.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            
            textFieldEmail.topAnchor.constraint(equalTo: labelLoginDescription.bottomAnchor, constant: 30),
            textFieldEmail.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 28),
            textFieldEmail.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -28),
            
            textFieldPassword.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 24),
            textFieldPassword.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 28),
            textFieldPassword.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -28),
            
            buttonSignIn.widthAnchor.constraint(equalToConstant: 300),
            buttonSignIn.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor, constant: 30),
            buttonSignIn.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            bottomStackView.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            bottomStackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20)
            
        ])
    }
    
    
    //MARK: initializing constraints...
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

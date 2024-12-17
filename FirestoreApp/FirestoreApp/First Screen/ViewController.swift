//
//  ViewController.swift
//  FirestoreApp
//
//  Created by Jiali Han on 11/5/24.
//

import UIKit
import FirebaseAuth


class ViewController: UIViewController {
    var handleAuth: AuthStateDidChangeListenerHandle?
    var currentUser:FirebaseAuth.User?
    let loginPage = LoginScreenView()
    
    
    override func loadView() {
        view = loginPage
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //MARK: handling if the Authentication state is changed (sign in, sign out, register)...
        handleAuth = Auth.auth().addStateDidChangeListener{ auth, user in
            if user == nil{
                //MARK: not signed in...
                
            }else{
                //MARK: the user is signed in...
                let mainScreen = MainViewController()
                self.navigationController?.pushViewController(mainScreen, animated: true)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginPage.registerButton.addTarget(self, action: #selector(onButtonRegisterTapped), for: .touchUpInside)
        loginPage.loginButton.addTarget(self, action: #selector(onLoginButtonTapped), for: .touchUpInside)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Auth.auth().removeStateDidChangeListener(handleAuth!)
    }
    
    // MARK: - Button functions
    @objc func onButtonRegisterTapped() {
        let registerScreen = RegisterViewController()
        navigationController?.pushViewController(registerScreen, animated: true)
    }

    @objc func onLoginButtonTapped() {
        /**
         This function will try to login the page, it will push main Screen out if success
         */
        if let email = self.loginPage.emailFeild.text,
           let password = self.loginPage.pwFeild.text {
            signInToFirebase(email: email, password: password)
        }
    }


// MARK: - Email and Password Authentication
func signInToFirebase(email: String, password: String){
    Auth.auth().signIn(withEmail: email, password: password, completion: {(result, error) in
        if error == nil{
            // user authenticated...
            
        }else{
            let signInAlert = UIAlertController(
                title: "Sign In Failed",
                message: "Please check email or password",
                preferredStyle: .alert)
            

            signInAlert.addAction(UIAlertAction(title: "OK", style: .cancel))
            
            self.present(signInAlert, animated: true)
        }
        
    })
}
}

#Preview("ViewController") {
    ViewController()
}


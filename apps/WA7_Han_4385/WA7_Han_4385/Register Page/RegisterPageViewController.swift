//
//  RegisterPageViewController.swift
//  WA7_Han_4385
//
//  Created by Jiali Han on 10/29/24.
//

import UIKit
import Alamofire

//class RegisterPageViewController: UIViewController, 
//                                  AuthErrorHandleProtocol {
//    
//    // persistent storage for the app (UserDefaults)
//    let defaults = UserDefaults.standard
//    let notificationCenter = NotificationCenter.default
//    let registerPage = RegisterPageView()
//    
//    override func loadView() {
//        view = registerPage
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        // click sign up button -> trigger register process
//        registerPage.buttonSignUp.addTarget(
//            self,
//            action: #selector(onButtonSignUpTapped),
//            for: .touchUpInside)
//    }
//
//    // handle registration when sign-up button is tapped
//    @objc func onButtonSignUpTapped() {
//        guard let name = registerPage.textFieldName.text, !name.isEmpty,
//              let email = registerPage.textFieldEmail.text, !email.isEmpty,
//              let password = registerPage.textFieldPassword.text, !password.isEmpty else {
//            // Show an alert if any field is empty
//            let alert = UIAlertController(title: "Error", 
//                                          message: "All fields should not be empty. Please check your input fields and try again.", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "OK", style: .default))
//            self.present(alert, animated: true)
//            return
//        }
//        
//        if !isValidEmail(email) {
//            let alert = UIAlertController(title: "Error!", 
//                                          message: "The email is not valid!",
//                                          preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "OK", style: .default))
//            self.present(alert, animated: true)
//            return
//        }
//        
//        // call the register function with a completion handler
//        register(name: name, 
//                 email: email,
//                 password: password) {
//            [weak self] (result: Result<AuthToken, AuthError>) in
//            
//            switch result {
//            case .success(let authToken):
//                // post a notification on successful registration
//                NotificationCenter.default.post(name: .tokenReceived, 
//                                                object: authToken.token)
//                print("Auth Token received: \(authToken.token)")
//                
//            case .failure(let error):
//                // handle registration failures
//                self?.handleAuthError(error)
//            }
//        }
//        
//        // add observer to listen for the token notification
//        NotificationCenter.default.addObserver(
//            self,
//            selector: #selector(setToken(notification:)),
//            name: .tokenReceived,
//            object: nil
//        )
//    }
//
//    // get name, email, and password fields as an array
//    func getRegistrationData() -> [String]? {
//        if let unwarppedName = registerPage.textFieldName.text,
//           let unwarppedEmail = registerPage.textFieldEmail.text,
//           let unwarppedPw = registerPage.textFieldPassword.text {
//            return [unwarppedName, unwarppedEmail, unwarppedPw]
//        }
//        return nil
//    }
//    
//    // save the received token and navigates to notes page on success
//    @objc func setToken(notification: Notification){
//        defaults.set(notification.object as! String, forKey: "AuthToken")
//        print("Auth Token has been set as \(notification.object as! String)")
//        
//        pushOutNotesPage(animated: true)
//    }
//    
//    func pushOutNotesPage(animated: Bool) {
//        let notesPage = DisplayNotesPageViewController()
//        navigationController?.pushViewController(notesPage, animated: animated)
//    }
//
//    func isValidEmail(_ email: String) -> Bool {
//        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
//        return NSPredicate(format: "SELF MATCHES %@", emailRegEx).evaluate(with: email)
//    }
//}

class RegisterPageViewController: UIViewController, AuthErrorHandleProtocol {
    
    let defaults = UserDefaults.standard
    let notificationCenter = NotificationCenter.default
    let registerPage = RegisterPageView()
    
    override func loadView() {
        view = registerPage
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerPage.buttonSignUp.addTarget(
            self,
            action: #selector(onButtonSignUpTapped),
            for: .touchUpInside
        )
        
        // Add observer only once
        notificationCenter.addObserver(
            self,
            selector: #selector(setToken(notification:)),
            name: .tokenReceived,
            object: nil
        )
    }
    
    deinit {
        // Ensure observer is removed when the view controller is deinitialized
        notificationCenter.removeObserver(self, name: .tokenReceived, object: nil)
    }

    @objc func onButtonSignUpTapped() {
        guard let name = registerPage.textFieldName.text, !name.isEmpty,
              let email = registerPage.textFieldEmail.text, !email.isEmpty,
              let password = registerPage.textFieldPassword.text, !password.isEmpty else {
            let alert = UIAlertController(title: "Error",
                                          message: "All fields should not be empty. Please check your input fields and try again.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
            return
        }
        
        if !isValidEmail(email) {
            let alert = UIAlertController(title: "Error!",
                                          message: "The email is not valid!",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
            return
        }
        
        register(name: name, email: email, password: password) {
            [weak self] (result: Result<AuthToken, AuthError>) in
            
            switch result {
            case .success(let authToken):
                NotificationCenter.default.post(name: .tokenReceived, object: authToken.token)
                print("Auth Token received: \(authToken.token)")
                
            case .failure(let error):
                self?.handleAuthError(error)
            }
        }
    }

    @objc func setToken(notification: Notification) {
        defaults.set(notification.object as! String, forKey: "AuthToken")
        print("Auth Token has been set as \(notification.object as! String)")
        
        pushOutNotesPage(animated: true)
        
        // remove observer after handling the token
        notificationCenter.removeObserver(self, name: .tokenReceived, object: nil)
    }
    
    func pushOutNotesPage(animated: Bool) {
        let notesPage = DisplayNotesPageViewController()
        navigationController?.pushViewController(notesPage, animated: animated)
    }

    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegEx).evaluate(with: email)
    }
}

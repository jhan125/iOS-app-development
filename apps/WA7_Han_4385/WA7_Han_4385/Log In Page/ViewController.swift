//
//  ViewController.swift
//  WA7_Han_4385
//
//  Created by Jiali Han on 10/29/24.
//

import UIKit

//class ViewController: UIViewController {
//    
//    // persistent storage for the app (UserDefaults)
//    let defaults = UserDefaults.standard
//    
//    let notificationCenter = NotificationCenter.default
//    
//    let loginPage = LoginPageView()
//    
//    override func loadView() {
//        view = loginPage
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        // if the user is already logged in, push notes page immediately
//        if (checkLogin()) {
//            pushOutNotesPage(animated: false)
//        }
//        
//        // click sign-in button -> start login process
//        loginPage.buttonSignIn.addTarget(self, 
//                                         action: #selector(onButtonSignInTapped),
//                                         for: .touchUpInside)
//        
//        // click sign-up button -> open register page
//        loginPage.buttonSignUp.addTarget(self, 
//                                         action: #selector(onButtonSignUpTapped),
//                                         for: .touchUpInside)
//        
//        // add tap recognizer to hide keyboard when tapping outside fields
//        let tapRecognizer = UITapGestureRecognizer(target: self, 
//                                                   action: #selector(hideKeyboardOnTap))
//        view.addGestureRecognizer(tapRecognizer)
//    }
//    
//    // MARK: open the registration page when sign-up button is tapped
//    @objc func onButtonSignUpTapped() {
//        let registerPage = RegisterPageViewController()
//        navigationController?.pushViewController(registerPage, animated: true)
//    }
//    
//    // MARK: handle sign-in process when login button is tapped
//    @objc func onButtonSignInTapped() {
//        guard let email = loginPage.textFieldEmail.text, !email.isEmpty,
//              let password = loginPage.textFieldPassword.text, !password.isEmpty
//        else {
//            // show alert if email or password is missing
//            let alert = UIAlertController(title: "Error", 
//                                          message: "Email and Password cannot be empty.",
//                                          preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "OK", style: .default))
//            self.present(alert, animated: true)
//            return
//        }
//        
//        // call login auth service with a completion handler
//        login(email: email, password: password) {
//            [weak self] result in
//            switch result {
//            case .success(let authToken):
//                // notification on successful login
//                NotificationCenter.default.post(name: .tokenReceived, 
//                                                object: authToken.token)
//                print("Received Auth Token: \(authToken.token)")
//                
//            case .failure(let error):
//                //MARK: handle failure error by response code...
//                self?.handleAuthError(error)
//            }
//        }
//        
//        // add observer to listen for login success token
//        notificationCenter.addObserver(
//            self,
//            selector: #selector(setToken(notification:)),
//            name: .tokenReceived,
//            object: nil
//        )
//    }
//    
//    // set token in UserDefaults and pushes to notes page on login success
//    @objc func setToken(notification: Notification){
//        defaults.set(notification.object as! String, forKey: "AuthToken")
//        print("Auth Token has been set as \(notification.object as! String)")
//        pushOutNotesPage(animated: true)
//    }
//    
//    // get saved auth token from UserDefaults
//    func getToken() -> String? {
//        let AuthTokenSaved = defaults.object(forKey: "AuthToken") as! String?
//        
//        if let token = AuthTokenSaved{
//            print("Auth Token was saved as: \(token)")
//            return token
//        }
//        return nil
//    }
//    
//    func pushOutNotesPage(animated: Bool) {
//        let notesPage = DisplayNotesPageViewController()
//        navigationController?.pushViewController(notesPage, animated: animated)
//    }
//    
//    // checks if user is logged in by looking for a saved token
//    func checkLogin() -> Bool {
//        return getToken() != nil
//    }
//    
//    // hides the keyboard when the screen is tapped outside of input fields
//    @objc func hideKeyboardOnTap(){
//        view.endEditing(true)
//    }
//}

class ViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    let notificationCenter = NotificationCenter.default
    let loginPage = LoginPageView()
    
    override func loadView() {
        view = loginPage
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if checkLogin() {
            pushOutNotesPage(animated: false)
        }
        
        loginPage.buttonSignIn.addTarget(
            self,
            action: #selector(onButtonSignInTapped),
            for: .touchUpInside
        )
        
        loginPage.buttonSignUp.addTarget(
            self,
            action: #selector(onButtonSignUpTapped),
            for: .touchUpInside
        )
        
        let tapRecognizer = UITapGestureRecognizer(target: self,
                                                   action: #selector(hideKeyboardOnTap))
        view.addGestureRecognizer(tapRecognizer)
    }

    @objc func onButtonSignUpTapped() {
        let registerPage = RegisterPageViewController()
        navigationController?.pushViewController(registerPage, animated: true)
    }
    
    @objc func onButtonSignInTapped() {
        guard let email = loginPage.textFieldEmail.text, !email.isEmpty,
              let password = loginPage.textFieldPassword.text, !password.isEmpty else {
            let alert = UIAlertController(title: "Error",
                                          message: "Email and Password cannot be empty.",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
            return
        }
        
        login(email: email, password: password) {
            [weak self] result in
            switch result {
            case .success(let authToken):
                print("Posting tokenReceived notification")
                NotificationCenter.default.post(name: .tokenReceived, 
                                                object: authToken.token)
                
            case .failure(let error):
                self?.handleAuthError(error)
            }
        }
        
        // add observer to listen for login success token
        notificationCenter.addObserver(
            self,
            selector: #selector(setToken(notification:)),
            name: .tokenReceived,
            object: nil
        )
    }
    
    @objc func setToken(notification: Notification) {
        defaults.set(notification.object as! String, forKey: "AuthToken")
        print("Auth Token has been set as \(notification.object as! String)")
        
        pushOutNotesPage(animated: true)
        
        // remove observer after handling the token
        notificationCenter.removeObserver(self, name: .tokenReceived, object: nil)
    }
    
    func getToken() -> String? {
        return defaults.string(forKey: "AuthToken")
    }
    
    func pushOutNotesPage(animated: Bool) {
        let notesPage = DisplayNotesPageViewController()
        navigationController?.pushViewController(notesPage, animated: animated)
    }
    
    func checkLogin() -> Bool {
        return getToken() != nil
    }
    
    @objc func hideKeyboardOnTap() {
        view.endEditing(true)
    }
}

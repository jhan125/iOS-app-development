//
//  RegisterViewController.swift
//  FirestoreApp
//
//  Created by Jiali Han on 11/5/24.
//
import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

class RegisterViewController: UIViewController {
    var handleAuth: AuthStateDidChangeListenerHandle?
    var currentUser:FirebaseAuth.User?
    let RegisterScreen = RegisterView()
    
    override func loadView() {
        view = RegisterScreen
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
                self.navigationController?.popViewController(animated: false)
                self.navigationController?.pushViewController(mainScreen, animated: true)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        RegisterScreen.signUpButton.addTarget(self, action: #selector(onSignUpTapped), for: .touchUpInside)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Auth.auth().removeStateDidChangeListener(handleAuth!)
    }
    
    // MARK: - button functions
    @objc func onSignUpTapped() {
        if let email = RegisterScreen.emailFeild.text,
           let pw = RegisterScreen.pwFeild.text,
           let name = RegisterScreen.nameFeild.text {
            Auth.auth().createUser(withEmail: email, password: pw) { authResult, error in
                if let error = error {
                    // we have an error
                    print("User Create Error")
                    print(error.localizedDescription)
                } else if let uid = authResult?.user.uid {
                    // successful create user, we then save data in database
                    let newUser = User(uid: uid, name: name)
                    self.addUserToFirestore(uid: uid, user:newUser)
                }
            }
        }
    }
    
    
    func addUserToFirestore(uid: String, user: User) {
        let db = Firestore.firestore()
        do {
            // add to Users
            try db.collection("Users").document(uid).setData(from: user)
            print("User \(user.name) has been created")
        } catch {
            print("Fail resgiter to firestore")
        }
    }
}

#Preview("RegisterViewController") {
    RegisterViewController()
}


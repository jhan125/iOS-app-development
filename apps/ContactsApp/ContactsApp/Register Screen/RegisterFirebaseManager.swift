//
//  RegisterFirebaseManager.swift
//  ContactsApp
//
//  Created by Jiali Han on 11/5/24.
//
import Foundation
import FirebaseAuth

// ATTENTION: Firebase calls are asynchronous, requiring network communications and server processing. So the sequence of events is very important. You must wait until one operation is done, then conduct the next operation. We cannot create a Firebase user and update profile operations together. We have to wait for the user to be created first. If the response is successful and the user is created, we update the profile. You must think carefully before writing codes and maintain the chain of Firebase calls correctly to avoid errors.
extension RegisterViewController{
    
    // creates a new account using Firebase Authentication service.
    func registerNewAccount(){
        //MARK: before we start creating the request for creating a user, we show the progress indicator.
        showActivityIndicator()
        //MARK: create a Firebase user with email and password...
        if let name = registerView.textFieldName.text,
           let email = registerView.textFieldEmail.text,
           let password = registerView.textFieldPassword.text{
            //send a request to the Firebase Authentication service to create a user with email and password..
            Auth.auth().createUser(withEmail: email,
                                   password: password,
                                   completion: {result, error in
                if error == nil{
                    //MARK: the user creation is successful...
                    self.setNameOfTheUserInFirebaseAuth(name: name)
                }else{
                    //MARK: there is a error creating the user...
                    print(error)
                }
            })
        }
    }
    
    //MARK: updates the profile of the created user after we create the account...
    func setNameOfTheUserInFirebaseAuth(name: String){
        
        // create a change request for the current FirebaseAuth user.
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        
        // set the intended name of the user in the change request.
        changeRequest?.displayName = name
        
        // handles what happens after the profile update.
        changeRequest?.commitChanges(
            completion: {(error) in
            if error == nil{
                //MARK: the profile update is successful...
                
                //MARK: after the profile update is done, we hide the progress indicator.
                self.hideActivityIndicator()
                
                //MARK: pop the current controller...
                self.navigationController?.popViewController(animated: true)
            }else{
                //MARK: there was an error updating the profile...
                print("Error occured: \(String(describing: error))")
            }
        })
    }
}


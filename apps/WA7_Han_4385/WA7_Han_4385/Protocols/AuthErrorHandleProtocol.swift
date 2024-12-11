//
//  AuthErrorHandleProtocol.swift
//  WA7_Han_4385
//
//  Created by Jiali Han on 11/2/24.
//

import Foundation
import UIKit

protocol AuthErrorHandleProtocol {
    func handleAuthError(_ error: AuthError)
}

extension AuthErrorHandleProtocol where Self: UIViewController {
    func handleAuthError(_ error: AuthError) {
        let message: String
        
        switch error {
            
        case .networkError:
            message = "Network error. Please try again."
            
        case .invalidCredentials:
            message = "Invalid credentials. Please check your email and password then try again."
            
        case .failedDecoding:
            message = "JSON couldn't be decoded. Failed to process response. Please try again."
        
        case .userExistsError:
            message = "User already exists. Please log in or use a different email to register."
            
        case .userNotFound:
            message = "User not found. Please register or check your email."
                   
        case .wrongInput:
            message = "Incorrect password. Please try again."
            
        }
    
        // alert message
        let alert = UIAlertController(title: "Error", 
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", 
                                      style: .default))
        self.present(alert, animated: true)
    }
}

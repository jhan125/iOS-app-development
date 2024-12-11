//
//  ProfileViewController.swift
//  WA7_Han_4385
//
//  Created by Jiali Han on 10/29/24.
//

import UIKit

class ProfileViewController: UIViewController {

    let defaults = UserDefaults.standard
    let notificationCenter = NotificationCenter.default
    let profilePage = ProfileView()
    
    override func loadView() {
        view = profilePage
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My Profile"
        
        fetchUserProfile()
    }
    
    func initData(user: User) {
        profilePage.labelEmailContent.text = user.email
        profilePage.labelNameContent.text = user.name
        profilePage.labelUserIdContent.text = user._id
    }
    
    // fetch profile and handle results
    func fetchUserProfile() {
        guard let token = getToken() else {
            handleAuthError(.invalidCredentials)
            return
        }
        
        getProfile(token: token) { [weak self] result in
            switch result {
            case .success(let user):
                self?.initData(user: user)
                
            case .failure(let error):
                self?.handleAuthError(error)
            }
        }
    }
    
    func getToken() -> String? {
        let AuthTokenSaved = defaults.object(forKey: "AuthToken") as! String?
        
        if let token = AuthTokenSaved{
            return token
        }
        return nil
    }
}

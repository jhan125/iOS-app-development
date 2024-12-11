//
//  AuthAPIProtocol.swift
//  WA7_Han_4385
//
//  Created by Jiali Han on 10/29/24.
//

import Foundation
// Base URL: http://apis.sakibnm.work:3000/api/auth/

// register a new account: email, password, name
protocol AuthTokenRegisterProtocol {
    func register(name: String,
                  email: String,
                  password: String,
                  completion: @escaping (Result<AuthToken, AuthError>) -> Void)
}

// log into user account: email, password
protocol AuthTokenLoginProtocol {
    func login(email: String,
               password: String,
               completion: @escaping (Result<AuthToken, AuthError>) -> Void)
}

// get user details: _id, name, email, _v
protocol GetProfileProtocol{
    func getProfile(token: String,
                    completion: @escaping (Result<User, AuthError>) -> Void)
}

// log out current user
protocol LogoutProtocol{
    func logout(token: String)
}

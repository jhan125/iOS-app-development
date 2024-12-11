//
//  AuthError.swift
//  WA7_Han_4385
//
//  Created by Jiali Han on 11/2/24.
//

import Foundation

enum AuthError: Error {
    case networkError
    case invalidCredentials // incorrect password or general login failures
    case failedDecoding
    case userExistsError // user already exists (500) configured by server side
    case userNotFound // user not found (404)
    case wrongInput // wrong email/password (401)
}

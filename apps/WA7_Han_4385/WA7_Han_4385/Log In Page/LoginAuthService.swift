//
//  LoginAuthService.swift
//  WA7_Han_4385
//
//  Created by Jiali Han on 10/29/24.
//

import Foundation
import Alamofire

extension ViewController: AuthTokenLoginProtocol, AuthErrorHandleProtocol {
    
    func login(email: String, password: String, completion: @escaping (Result<AuthToken, AuthError>) -> Void) {
        guard let url = URL(string: APIConfigs.AuthURL + "login") else { return }
        
        AF.request(url, method: .post, parameters: ["email": email, 
                                                    "password": password])
            .responseData { response in
                let statusCode = response.response?.statusCode
                
                switch response.result {
                case .success(let data):
                    guard let uwStatusCode = statusCode else {
                        completion(.failure(.networkError))
                        return
                    }
                    
                    switch uwStatusCode {
                    case 200...299:
                        let decoder = JSONDecoder()
                        do {
                            let receivedData = try decoder.decode(AuthToken.self, 
                                                                  from: data)
                            if receivedData.auth {
                                completion(.success(receivedData))
                            } else {
                                completion(.failure(.invalidCredentials))
                            }
                        } catch {
                            completion(.failure(.failedDecoding))
                        }
                    
                    case 401:
                        // unauthorized - wrong email/password
                        completion(.failure(.wrongInput))
                    
                    case 404:
                        // user not found
                        completion(.failure(.userNotFound))
                        
                    case 400...499:
                        // all other client errors
                        completion(.failure(.invalidCredentials))
                        
                    default:
                        completion(.failure(.networkError))
                    }
                    
                case .failure:
                    completion(.failure(.networkError))
                }
            }
    }
}

/*
 - 200...299 (Success Range):

 - 409 (Conflict - User Already Exists):
 
 - 400...499 (Client Error Range):

     -400: Bad Request (e.g., missing or invalid input data).
     -401: Unauthorized (though not typical in registration).
     -403: Forbidden.
     -404: Not Found (e.g., endpoint not found, but less likely here).
 
 - 500...599 (Server Error Range, e.g. networkError).

 */

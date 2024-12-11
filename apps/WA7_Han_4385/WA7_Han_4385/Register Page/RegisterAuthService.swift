//
//  RegisterAuthService.swift
//  WA7_Han_4385
//
//  Created by Jiali Han on 10/29/24.
//

import Foundation
import UIKit
import Alamofire

extension RegisterPageViewController: AuthTokenRegisterProtocol {
    
    func register(name: String,
                  email: String,
                  password: String,
                  completion: @escaping (Result<AuthToken, AuthError>) -> Void) {
        
        guard let url = URL(string: APIConfigs.AuthURL + "register") else { return }
        
        AF.request(url, method: .post, parameters: ["name": name,
                                                    "email": email,
                                                    "password": password])
        .responseData { response in
            //MARK: retrieving the status code...
            let statusCode = response.response?.statusCode
            
            switch response.result {
                
            //MARK: there was no network error...
            case .success(let data):
                
                //MARK: status code is Optional, so unwrapping it...
                guard let uwStatusCode = statusCode else {
                    completion(.failure(.networkError))
                    return
                }
                
                // check output
                print("Status Code: \(uwStatusCode)")
                if let responseData = String(data: data, encoding: .utf8) {
                    print("Response Data: \(responseData)")
                }
                
                switch uwStatusCode {
                    
                case 200...299:
                //MARK: the request was valid 200-level...
                    
                    let decoder = JSONDecoder()
                    do {
                        let receivedData = try decoder.decode(AuthToken.self, from: data)
                        
                        if receivedData.auth {
                            completion(.success(receivedData))
                            
                            self.notificationCenter.post(
                                name: .tokenReceived,
                                object: receivedData.token)
                            
                            print("User registered successfully.")
                            print("Received Auth Token: \(receivedData.token)")
                            
                        } else {
                            completion(.failure(.invalidCredentials))
                            
                            print("!! Auth Token can't be validated !!")
                        }
                        
                    } catch {
                        completion(.failure(.failedDecoding))
                    }
                    
                case 500:
                    // if user already exists case
                    completion(.failure(.userExistsError))
                    
                case 400...499:
                //MARK: the request was not valid 400-level...
                    completion(.failure(.invalidCredentials))
                    
                    print(data)
                    
                default:
                //MARK: probably a 500-level error...
                    completion(.failure(.networkError))
                    print(data)
                }
                
            case .failure:
                //MARK: there was a network error...
                completion(.failure(.networkError))
            }
        }
    }
}

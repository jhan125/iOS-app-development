//
//  ProfileAuthService.swift
//  WA7_Han_4385
//
//  Created by Jiali Han on 10/29/24.
//

import Foundation
import Alamofire

extension ProfileViewController: GetProfileProtocol, 
                                 AuthErrorHandleProtocol {
    
    func getProfile(token: String, 
                    completion: @escaping (Result<User, AuthError>) -> Void) {
        
        guard let url = URL(string: APIConfigs.AuthURL + "me") else { return }
        
        // make GET request to profile endpoint with the token in headers
        AF.request(url, method: .get, headers: ["x-access-token": token])
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
                            let userData = try decoder.decode(User.self, from: data)
                            completion(.success(userData))
                        } catch {
                            completion(.failure(.failedDecoding))
                        }
                        
                    case 400...499:
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

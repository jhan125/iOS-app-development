//
//  LogoutService.swift
//  WA7_Han_4385
//
//  Created by Jiali Han on 11/2/24.
//

import Foundation
import Alamofire

extension DisplayNotesPageViewController: LogoutProtocol {
    
    func logout(token: String) {
        guard let url = URL(string: APIConfigs.NotesURL + "logout") else { return }
        
        AF.request(url, method: .get, headers: ["x-access-token": token])
            .responseData { response in
                self.handleResponse(
                    response,
                    successStatusCode: 200...299) {
                        _ in
                        print("Successfully logged out.")
                    }
            }
    }
    
    private func handleResponse(_ response: AFDataResponse<Data>, 
                                successStatusCode: ClosedRange<Int>,
                                onSuccess: (Data) -> Void) {
        
        let statusCode = response.response?.statusCode
        
        switch response.result {
        case .success(let data):
            guard let uwStatusCode = statusCode else {
                self.handleAuthError(.networkError)
                return
            }
            
            if successStatusCode.contains(uwStatusCode) {
                onSuccess(data)
            } else {
                self.handleSpecificHttpError(statusCode: uwStatusCode)
            }
            
        case .failure:
            self.handleAuthError(.networkError)
        }
    }
    
    private func handleSpecificHttpError(statusCode: Int) {
        switch statusCode {
        case 401:
            self.handleAuthError(.wrongInput)
        case 403:
            print("Forbidden access.")
            self.handleAuthError(.invalidCredentials)
        case 404:
            print("Logout endpoint not found.")
        case 400...499:
            self.handleAuthError(.invalidCredentials)
        case 500...599:
            print("Server error during logout.")
            self.handleAuthError(.networkError)
        default:
            self.handleAuthError(.networkError)
        }
    }
}


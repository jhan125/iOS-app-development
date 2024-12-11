//
//  GetAllNotesService.swift
//  WA7_Han_4385
//
//  Created by Jiali Han on 10/29/24.
//

import Foundation
import Alamofire

extension DisplayNotesPageViewController: GetAllNoteProtocol,
                                          AuthErrorHandleProtocol {
    
    func getAllNotes(token: String) {
        guard let url = URL(string: APIConfigs.NotesURL + "getall") else { return }
        
        AF.request(url, method: .get, headers: ["x-access-token": token])
            .responseData { response in
                self.handleResponse(response, 
                                    successStatusCode: 200...299) { data in
                    do {
                        let receivedData = try JSONDecoder().decode(Notes.self, 
                                                                    from: data)
                        self.notificationCenter.post(name: .notesReceived, object: receivedData)
                    } catch {
                        self.handleAuthError(.failedDecoding)
                    }
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
        case 404:
            print("Notes not found.")
        case 409:
            print("Conflict error.")
        case 400...499:
            self.handleAuthError(.invalidCredentials)
        case 500...599:
            print("Server error.")
            self.handleAuthError(.networkError)
        default:
            self.handleAuthError(.networkError)
        }
    }
}

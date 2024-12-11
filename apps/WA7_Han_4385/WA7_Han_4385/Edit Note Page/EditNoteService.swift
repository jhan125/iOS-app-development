//
//  EditNoteService.swift
//  WA7_Han_4385
//
//  Created by Jiali Han on 10/29/24.
//

import Foundation
import Alamofire

//extension EditNoteViewController: PostNoteProtocol, 
//                                  DeleteANoteProtocol,
//                                  AuthErrorHandleProtocol {
//    
//    func post(token: String, text: String) {
//        guard let url = URL(string: APIConfigs.NotesURL + "post") else { return }
//        
//        AF.request(url, method: .post,
//                   parameters: ["text": text],
//                   headers: ["x-access-token": token])
//            .responseData { response in
//                self.handleResponse(response, successStatusCode: 200...299) { data in
//                    do {
//                        let receivedData = try JSONDecoder().decode(AddNote.self, from: data)
//                        if receivedData.posted {
//                            self.finishPost(note: receivedData.note)
//                        } else {
//                            print("There is a problem when posting the note.")
//                        }
//                    } catch {
//                        self.handleAuthError(.failedDecoding)
//                    }
//                }
//            }
//    }
//    
//    func deleteNote(token: String, note: Note) {
//        guard let url = URL(string: APIConfigs.NotesURL + "delete") else { return }
//        
//        AF.request(url, method: .post,
//                   parameters: ["id": note._id],
//                   headers: ["x-access-token": token])
//            .responseData { response in
//                self.handleResponse(response, successStatusCode: 200...299) { data in
//                    do {
//                        let receivedData = try JSONDecoder().decode(DeleteNote.self, from: data)
//                        if receivedData.delete {
//                            self.finishDelete(token: token, note: note)
//                        } else {
//                            print("There is a problem when deleting the note.")
//                        }
//                    } catch {
//                        self.handleAuthError(.failedDecoding)
//                    }
//                }
//            }
//    }
//    
//    private func handleResponse(_ response: AFDataResponse<Data>, successStatusCode: ClosedRange<Int>, onSuccess: (Data) -> Void) {
//        let statusCode = response.response?.statusCode
//        
//        switch response.result {
//        case .success(let data):
//            guard let uwStatusCode = statusCode else {
//                self.handleAuthError(.networkError)
//                return
//            }
//            
//            if successStatusCode.contains(uwStatusCode) {
//                onSuccess(data)
//            } else {
//                self.handleSpecificHttpError(statusCode: uwStatusCode)
//            }
//            
//        case .failure:
//            self.handleAuthError(.networkError)
//        }
//    }
//    
//    private func handleSpecificHttpError(statusCode: Int) {
//        switch statusCode {
//        case 401:
//            self.handleAuthError(.wrongInput)
//        case 404:
//            print("Note not found.")
//        case 409:
//            print("Conflict error.")
//        case 400...499:
//            self.handleAuthError(.invalidCredentials)
//        case 500...599:
//            print("Server error.")
//            self.handleAuthError(.networkError)
//        default:
//            self.handleAuthError(.networkError)
//        }
//    }
//    
//    func finishPost(note: Note) {
//        navigationController?.popViewController(animated: true)
//        self.notificationCenter.post(name: .posted, object: note)
//    }
//    
//    func edit(token: String, note: Note) {
//        deleteANote(token: token, note: note)
//    }
//    
//    func finishDelete(token: String, note: Note) {
//        self.notificationCenter.post(name: .deleted, object: note)
//    }
//}


extension EditNoteViewController: PostNoteProtocol,
                                  DeleteANoteProtocol,
                                  AuthErrorHandleProtocol {
    
    func postNote(token: String, text: String) {
        guard let url = URL(string: APIConfigs.NotesURL + "post") else { return }
        
        AF.request(url, method: .post, 
                   parameters: ["text": text], 
                   headers: ["x-access-token": token])
        
            .responseData { response in
                let statusCode = response.response?.statusCode
                
                switch response.result {
                case .success(let data):
                    guard let uwStatusCode = statusCode else {
                        self.handleAuthError(.networkError)
                        return
                    }
                    
                    switch uwStatusCode {
                    case 200...299:
                        let decoder = JSONDecoder()
                        do {
                            let receivedData = try decoder.decode(AddNote.self, from: data)
                            if receivedData.posted {
                                self.finishPost(note: receivedData.note)
                            } else {
                                print("There is a problem when posting the note.")
                            }
                        } catch {
                            self.handleAuthError(.failedDecoding)
                        }
                        
                    case 400...499:
                        self.handleAuthError(.invalidCredentials)
                        
                    default:
                        self.handleAuthError(.networkError)
                    }
                    
                case .failure:
                    self.handleAuthError(.networkError)
                }
            }
    }
    
    func deleteNote(token: String, note: Note) {
        guard let url = URL(string: APIConfigs.NotesURL + "delete") else { return }
        
        AF.request(url, method: .post, parameters: ["id": note._id], headers: ["x-access-token": token])
            .responseData { response in
                let statusCode = response.response?.statusCode
                
                switch response.result {
                case .success(let data):
                    guard let uwStatusCode = statusCode else {
                        self.handleAuthError(.networkError)
                        return
                    }
                    
                    switch uwStatusCode {
                    case 200...299:
                        let decoder = JSONDecoder()
                        do {
                            let receivedData = try decoder.decode(DeleteNote.self, from: data)
                            if receivedData.delete {
                                self.finishDelete(token: token, note: note)
                            } else {
                                print("There is a problem when deleting the note.")
                            }
                        } catch {
                            self.handleAuthError(.failedDecoding)
                        }
                        
                    case 400...499:
                        self.handleAuthError(.invalidCredentials)
                    default:
                        self.handleAuthError(.networkError)
                    }
                    
                case .failure:
                    self.handleAuthError(.networkError)
                }
            }
    }
    
    // after successfully posting a new note, return to the previous display notes screen
    func finishPost(note: Note) {
        navigationController?.popViewController(animated: true)
        self.notificationCenter.post(name: .posted, object: note)
    }
    
    // to edit a note, delete the current note and prepare to post a new edited note
    func edit(token: String, note: Note) {
        deleteNote(token: token, note: note)
    }
    
    func finishDelete(token:String, note: Note) {
        postNote(token: token, text: note.text)
    }
}

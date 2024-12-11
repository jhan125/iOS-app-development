//
//  DeleteNoteService.swift
//  WA7_Han_4385
//
//  Created by Jiali Han on 11/2/24.
//

import Foundation
import Alamofire

extension DisplayNotesPageViewController: DeleteANoteProtocol {
    
    func deleteNote(token: String, note: Note) {
        
        guard let url = URL(string: APIConfigs.NotesURL + "delete") else { return }
        
        AF.request(url, method: .post,
                   parameters: ["id": note._id],
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
                        let receivedData = try decoder.decode(DeleteNote.self, from: data)
                        if receivedData.delete {
                            self.finishDelete(note: note)
                        } else {
                            print("Failed to delete the note. Try it again.")
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
    
    func finishDelete(note: Note) {
        // notify the system that a note was deleted
        self.notificationCenter.post(name: .deleted, object: note)
        print("Successfully deleted note: \(note.text)")
    }
}

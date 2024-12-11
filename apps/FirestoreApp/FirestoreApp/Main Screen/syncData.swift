//
//  syncData.swift
//  FirestoreApp
//
//  Created by Jiali Han on 11/5/24.
//

import Foundation
import Firebase

extension MainViewController {
    // MARK: - async call from the server
    func syncUsers() {
        let UserCol = db.collection("Users")
            
        UserCol.getDocuments {querySnapshot, err in
            if let err = err {
                print("Error getting users: \(err)")
            } else if let querySnapshot = querySnapshot {
                self.updateLocalUsers(documents: querySnapshot.documents)
                self.notificationCenter.post(name: .syncUsersDidComplete, object: nil)
            }
            
        }
    }
    
    func syncAllChatRooms() {
        self.MessageRooms = []
        for otherUser in self.users {
            syncChatRooms(guest: otherUser)
        }
    }
    
    func syncChatRooms(guest: User) {

        if let uid = self.currentUser?.uid {
            let ChatRoom = db.collection("ChatRoom").document(uid).collection(guest.uid)
            
            ChatRoom.getDocuments {querySnapshot, err in
                if let err = err {
                    print("Error getting users: \(err)")
                } else if let querySnapshot = querySnapshot {
                    self.updateChatRoom(guest: guest, documents: querySnapshot.documents)
                }
                
            }
        }
    }

    // MARK: - local documents Reader
    
    func updateLocalUsers(documents: [QueryDocumentSnapshot]) {
        /**
         This function will takes an QueryDocumentSnapshot Form firestore call. update the user array and table view
         */
        var users = [User]()
        print("Current Users")
        for document in documents {
            if let user = try? document.data(as: User.self) {
                if user.uid != self.currentUser?.uid {
                    users.append(user)
                    print(user.name)
                }
            }
        }
        print("-----------------------------------------------")
        self.users = users
    }
    
    func updateChatRoom(guest:User, documents: [QueryDocumentSnapshot]) {
        print("Update User \(guest.name)")
        var newMessageRoom = MessageRoom(guest: guest, Messages: [])
        for document in documents {
            if let newMessage = try? document.data(as: Message.self) {
                newMessageRoom.Messages.append(newMessage)
                print("add \(newMessage.Text)")
            }
        }
        self.MessageRooms.append(newMessageRoom)
        print("-----------------------------------------------")
        self.mainScreen.ChatTableView.reloadData()
        // self.messageRooms = messageRooms
    }
    
    // MARK: - post
    func postMessage(guestID: String, messageText: String) {
        /**
         Add messageText to both currentUser and guest's chatRoom
         */
        if let uid = self.currentUser?.uid {
            let nowTime = Date()
            let myChatRoom = db.collection("ChatRoom").document(uid).collection(guestID)
            let hisChatRoom = db.collection("ChatRoom").document(guestID).collection(uid)
            do {
                try myChatRoom.document().setData(from: Message(Received: true, Time: nowTime, Text: messageText))
                try hisChatRoom.document().setData(from: Message(Received: false, Time: nowTime, Text: messageText))
            } catch {
                print("Message \(messageText) cannot add")
            }
        }
    }

}

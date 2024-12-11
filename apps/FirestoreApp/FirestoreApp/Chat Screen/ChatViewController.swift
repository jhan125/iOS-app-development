//
//  ChatViewController.swift
//  FirestoreApp
//
//  Created by Jiali Han on 11/5/24.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

class ChatViewController: UIViewController {
    let db = Firestore.firestore()
    var currentUser:FirebaseAuth.User?
    let notificationCenter = NotificationCenter.default
    
    let formatter = DateFormatter()
    let chatScreen = ChatView()
    var guest: User?
    var messages: [Message]?
    
    override func loadView() {
        view = chatScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messages?.sort(by: {
            $0.Time.compare($1.Time) == .orderedDescending
        })
        messages?.reverse()
        currentUser = Auth.auth().currentUser
        
        chatScreen.MessageTableView.dataSource = self
        chatScreen.MessageTableView.delegate = self
        
        chatScreen.sendButton.addTarget(self, action: #selector(onSendTapped), for: .touchUpInside)
        
        scrollToBottom()
    }
    
    @objc func onSendTapped() {
        print("Tapped")
        let nowTime = Date()
        
        if let uid = self.currentUser?.uid,
           let guestID = guest?.uid,
           let messageText = chatScreen.inputFeild.text{
            
            let myChatRoom = db.collection("ChatRoom").document(uid).collection(guestID)
            let hisChatRoom = db.collection("ChatRoom").document(guestID).collection(uid)
            do {
                try myChatRoom.document().setData(from: Message(Received: true, Time: nowTime, Text: messageText))
                try hisChatRoom.document().setData(from: Message(Received: false, Time: nowTime, Text: messageText))
                print("Message \(messageText) Sent")
                chatScreen.inputFeild.text = ""
                
                messages?.append(Message(Received: true, Time: nowTime, Text: messageText))
                chatScreen.MessageTableView.reloadData()
            } catch {
                print("Message \(messageText) cannot add")
            }
            
            notificationCenter.post(name: .syncUsersDidComplete, object: nil)
        }
    }
    
    func scrollToBottom () {
        let numberofSections = chatScreen
            .MessageTableView.numberOfSections
        let numberofRows = chatScreen
            .MessageTableView.numberOfRows(inSection: numberofSections - 1)
        
        if numberofRows > 0 {
            let indexPath = IndexPath (
                row: numberofRows - 1, section: numberofSections - 1)
            
            print("Yes")
            chatScreen.MessageTableView
                .scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }
}


#Preview("ChatViewController") {
    ChatViewController()
}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource{
    //MARK: returns the number of rows in the current section...
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let unwarp = messages {
            return unwarp.count
        } else {
            return 0
        }
    }
    
    //MARK: populate a cell for the currecnt row...
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath) as! MessageTableViewCell
        
        if let unwarpGuest = guest {
            cell.labelName.text = unwarpGuest.name
        }
        
        if let unwarpMessages = messages {
            cell.labelText.text = unwarpMessages[indexPath.row].Text
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            cell.labelTime.text = formatter.string(from:unwarpMessages[indexPath.row].Time)
        }
        
        return cell
    }
    
}


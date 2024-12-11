//
//  MainViewController.swift
//  FirestoreApp
//
//  Created by Jiali Han on 11/5/24.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

class MainViewController: UIViewController {
    let notificationCenter = NotificationCenter.default
    let db = Firestore.firestore()
    let formatter = DateFormatter()
    let mainScreen = MainView()
    var currentUser:FirebaseAuth.User?
    
    var users: [User] = []
    var MessageRooms: [MessageRoom] = []
    
    
    override func loadView() {
        view = mainScreen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentUser = Auth.auth().currentUser
        
                 // Add a listener of Collection Users in firestore. This will automaticly update The list of User
//                let db = Firestore.firestore()
//                listenerRegistration = db.collection("Users").addSnapshotListener { [weak self] (querySnapshot, err) in
//                    if let err = err {
//                        print("Error getting documents: \(err)")
//                    } else if let querySnapshot = querySnapshot {
//                        self?.updateUsers(with: querySnapshot.documents)
//                    }
//                }
        
        mainScreen.ChatTableView.dataSource = self
        mainScreen.ChatTableView.delegate = self
        
        initData()
        mainScreen.logoutButton.addTarget(self, action: #selector(onLogoutTapped), for: .touchUpInside)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

    }
    
    @objc func onLogoutTapped() {
        do {
            try Auth.auth().signOut()   // sign out
            self.navigationController?.popViewController(animated: true)
            
        }
        catch {
            print("Cannot Sign out")
        }
    }
    
    func initData() {
        notificationCenter.addObserver(
                    self,
                    selector: #selector(nihao(notification:)),
                    name: .syncUsersDidComplete,
                    object: nil)
        
        syncUsers()
    }
    
    @objc func nihao(notification: Notification) {
        syncAllChatRooms()
        
         // postMessage(guestID: users[0].uid, messageText: "Hello, World")
    }
    
}


#Preview("MainViewController") {
    MainViewController()
}

extension Notification.Name {
    static let syncUsersDidComplete = Notification.Name("syncUsersDidComplete")
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource{
    //MARK: returns the number of rows in the current section...
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(MessageRooms.count)
        return MessageRooms.count
    }
    
    //MARK: populate a cell for the currecnt row...
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatCell", for: indexPath) as! MainChatTableViewCell
        
        print("initizling \(MessageRooms[indexPath.row].guest.name)")
        
        cell.labelName.text = MessageRooms[indexPath.row].guest.name
        
        if let recent = MessageRooms[indexPath.row].Messages.last {
            cell.labelText.text = recent.Text
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            cell.labelTime.text = formatter.string(from:recent.Time)
        }
        
        
        return cell
    }
    
    //MARK: deal with user interaction with a cell...
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chatScreen = ChatViewController()
        chatScreen.guest = MessageRooms[indexPath.row].guest
        chatScreen.messages = MessageRooms[indexPath.row].Messages
        navigationController?.pushViewController(chatScreen, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

}

//
//  ChatView.swift
//  FirestoreApp
//
//  Created by Jiali Han on 11/5/24.
//
import UIKit

class ChatView: UIView {
    
    var contentWrapper:UIScrollView!
    var MessageTableView: UITableView!
    var sendButton: UIButton!;
    var inputFeild: UITextField!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupContentWrapper()
        setupTableViewNote()
        
        setsendButton()
        setinputFeild()
        
        initConstraints()
    }
    
    //MARK: makes the table view be scrollable
    func setupContentWrapper() {
        contentWrapper = UIScrollView()
        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentWrapper)
    }
    
    //MARK: the table view to show the list of contacts...
    func setupTableViewNote(){
        MessageTableView = UITableView()
        MessageTableView.register(MessageTableViewCell.self, forCellReuseIdentifier: "MessageCell")
        MessageTableView.separatorStyle = .none
        MessageTableView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(MessageTableView)
    }
    
    func setsendButton() {
        sendButton = UIButton(type: .system)
        sendButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        sendButton.setTitle("Send", for: .normal)
        sendButton.configuration = .filled()
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(sendButton)
    }

    func setinputFeild() {
        inputFeild = UITextField()
        inputFeild.borderStyle = .roundedRect
        inputFeild.placeholder = "Enter Here"
        inputFeild.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(inputFeild)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([

            sendButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 10),
            sendButton.widthAnchor.constraint(equalToConstant: 70),
            sendButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            inputFeild.centerYAnchor.constraint(equalTo: sendButton.centerYAnchor),
            inputFeild.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            inputFeild.trailingAnchor.constraint(equalTo: sendButton.leadingAnchor, constant: -10),
            
            MessageTableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            MessageTableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            MessageTableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            MessageTableView.bottomAnchor.constraint(equalTo: inputFeild.topAnchor, constant: -8),
        ])
    }
    
    
    //MARK: initializing constraints...
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}

//
//  DisplayNotesPageView.swift
//  WA7_Han_4385
//
//  Created by Jiali Han on 10/29/24.
//

import UIKit

class DisplayNotesPageView: UIView {

    //MARK: tableView for contacts...
    var contentWrapper:UIScrollView!
    var NotesTableView: UITableView!
    var buttonLogout: UIButton!;
    var buttonProfile: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupContentWrapper()
        setupTableViewNote()
        
        setButtonLogout()
        setButtonProfile()
        
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
        NotesTableView = UITableView()
        NotesTableView.register(NoteTableViewCell.self, forCellReuseIdentifier: "noteCell")
        NotesTableView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(NotesTableView)
    }
    
    func setButtonLogout() {
        buttonLogout = UIButton(type: .system)
        buttonLogout.titleLabel?.font = .boldSystemFont(ofSize: 20)
        buttonLogout.setTitle("Logout", for: .normal)
        buttonLogout.configuration = .filled()
        buttonLogout.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonLogout)
    }

    func setButtonProfile() {
        buttonProfile = UIButton(type: .system)
        buttonProfile.titleLabel?.font = .boldSystemFont(ofSize: 20)
        buttonProfile.setTitle("Profile", for: .normal)
        buttonProfile.configuration = .gray()
        buttonProfile.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonProfile)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            contentWrapper.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            contentWrapper.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            contentWrapper.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            contentWrapper.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
                
            buttonLogout.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            buttonLogout.leadingAnchor.constraint(equalTo: self.centerXAnchor, constant: 16),
            
            buttonProfile.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            buttonProfile.trailingAnchor.constraint(equalTo: self.centerXAnchor, constant: -16),
            
            NotesTableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            NotesTableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            NotesTableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            NotesTableView.bottomAnchor.constraint(equalTo: buttonProfile.topAnchor, constant: -8),
        ])
    }
    
    //MARK: initializing constraints...
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

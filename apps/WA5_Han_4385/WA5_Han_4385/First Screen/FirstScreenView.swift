//
//  FirstScreenView.swift
//  WA5_Han_4385
//
//  Created by Jiali Han on 10/11/24.
//

import UIKit

class FirstScreenView: UIView {

    var tableViewContacts: UITableView!;
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        //MARK: initializing a TableView...
        setupTableViewContacts()
        initConstraints()
    }
    
    func setupTableViewContacts() {
        tableViewContacts = UITableView();
        tableViewContacts.register(TableViewContactsCell.self, forCellReuseIdentifier: "contactsList")
        tableViewContacts.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewContacts)
    }
    
    //MARK: setting the constraints...
    func initConstraints(){
        NSLayoutConstraint.activate([
            tableViewContacts.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
            tableViewContacts.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            tableViewContacts.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            tableViewContacts.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

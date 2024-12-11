//
//  ProfileView.swift
//  WA7_Han_4385
//
//  Created by Jiali Han on 10/29/24.
//

import UIKit

class ProfileView: UIView {

    var labelNameTitle: UILabel!
    var labelNameContent: UILabel!
    var labelEmailTitle: UILabel!
    var labelEmailContent: UILabel!
    var labelUserIdTitle: UILabel!
    var labelUserIdContent: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setLabelNameTitle()
        setLabelNameContent()
        setLabelEmail()
        setLabelEmailContent()
        setLabelUserIdTitle()
        setLabelUserIdContent()
        
        initConstraints()
    }
    
    func setLabelNameTitle() {
        labelNameTitle = UILabel()
        labelNameTitle.text = "Name: "
        labelNameTitle.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelNameTitle)
        
    }
    
    func setLabelNameContent() {
        labelNameContent = UILabel()
        labelNameContent.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelNameContent)
    }
    
    func setLabelEmail() {
        labelEmailTitle = UILabel()
        labelEmailTitle.text = "Email: "
        labelEmailTitle.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelEmailTitle)
    }
    
    func setLabelEmailContent() {
        labelEmailContent = UILabel()
        labelEmailContent.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelEmailContent)
    }
    
    func setLabelUserIdTitle() {
        labelUserIdTitle = UILabel()
        labelUserIdTitle.text = "User ID: "
        labelUserIdTitle.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelUserIdTitle)
    }
    
    func setLabelUserIdContent() {
        labelUserIdContent = UILabel()
        labelUserIdContent.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelUserIdContent)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            labelNameTitle.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            labelNameTitle.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            
            labelNameContent.leadingAnchor.constraint(equalTo: labelNameTitle.trailingAnchor, constant: 8),
            labelNameContent.centerYAnchor.constraint(equalTo: labelNameTitle.centerYAnchor),
            
            labelEmailTitle.topAnchor.constraint(equalTo: labelNameTitle.bottomAnchor, constant: 16),
            labelEmailTitle.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            
            labelEmailContent.leadingAnchor.constraint(equalTo: labelEmailTitle.trailingAnchor, constant: 8),
            labelEmailContent.centerYAnchor.constraint(equalTo: labelEmailTitle.centerYAnchor),
            
            labelUserIdTitle.topAnchor.constraint(equalTo: labelEmailTitle.bottomAnchor, constant: 16),
            labelUserIdTitle.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            
            labelUserIdContent.leadingAnchor.constraint(equalTo: labelUserIdTitle.trailingAnchor, constant: 8),
            labelUserIdContent.centerYAnchor.constraint(equalTo: labelUserIdTitle.centerYAnchor),
        ])
    }
    
    //MARK: initializing constraints...
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

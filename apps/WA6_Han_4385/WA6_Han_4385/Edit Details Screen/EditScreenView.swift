//
//  EditScreenView.swift
//  WA6_Han_4385
//
//  Created by Jiali Han on 10/21/24.
//

import UIKit

class EditScreenView: UIView {
   
    // Display and Edit Contact screens should be scrollable
    var contentWrapper: UIScrollView!
    
    var labelNameTitle: UILabel!
    var labelEmailTitle: UILabel!
    var labelPhoneTitle: UILabel!
    
    var textFieldName: UITextField!
    var textFieldEmail: UITextField!
    var textFieldPhone: UITextField!
    
    var ButtonSave: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupContentWrapper()
        
        setLabelNameTitle()
        setLabelEmailTitle()
        setLabelPhoneTitle()
        
        setTextFieldName()
        setTextFieldEmail()
        setTextFieldPhone()
        setButtonSave()
        
        initConstraints()
    }
    
    func setupContentWrapper() {
        contentWrapper = UIScrollView()
        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentWrapper)
    }
    
    func setLabelNameTitle() {
        labelNameTitle = UILabel()
        labelNameTitle.text = "Name: "
        labelNameTitle.font = UIFont.boldSystemFont(ofSize: 20);
        labelNameTitle.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(labelNameTitle)
    }
    
    func setLabelEmailTitle() {
        labelEmailTitle = UILabel()
        labelEmailTitle.text = "Email: "
        labelEmailTitle.font = UIFont.boldSystemFont(ofSize: 20);
        labelEmailTitle.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(labelEmailTitle)
    }
    
    func setLabelPhoneTitle() {
        labelPhoneTitle = UILabel()
        labelPhoneTitle.text = "Phone: "
        labelPhoneTitle.font = UIFont.boldSystemFont(ofSize: 20);
        labelPhoneTitle.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(labelPhoneTitle)
    }
    
    func setTextFieldName() {
        textFieldName = UITextField()
        textFieldName.font = UIFont.systemFont(ofSize: 20);
        textFieldName.borderStyle = .roundedRect
        textFieldName.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(textFieldName)
    }
    
    func setTextFieldEmail() {
        textFieldEmail = UITextField()
        textFieldEmail.font = UIFont.systemFont(ofSize: 20);
        textFieldEmail.borderStyle = .roundedRect
        textFieldEmail.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(textFieldEmail)
    }
    
    func setTextFieldPhone() {
        textFieldPhone = UITextField()
        textFieldPhone.font = UIFont.systemFont(ofSize: 20);
        textFieldPhone.borderStyle = .roundedRect
        textFieldPhone.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(textFieldPhone)
    }
    
    func setButtonSave() {
        ButtonSave = UIButton(type: .system)
        ButtonSave.titleLabel?.font = .boldSystemFont(ofSize: 20)
        ButtonSave.setTitle("Save", for: .normal)
        ButtonSave.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(ButtonSave)
    }

    
    func initConstraints () {
        let contentLayoutGuide = contentWrapper.contentLayoutGuide
        NSLayoutConstraint.activate([
            contentWrapper.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            contentWrapper.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            contentWrapper.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            contentWrapper.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            
            labelNameTitle.topAnchor.constraint(equalTo: contentWrapper.topAnchor, constant: 36),
            labelNameTitle.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            labelNameTitle.widthAnchor.constraint(equalToConstant: 80),
            
            textFieldName.centerYAnchor.constraint(equalTo: labelNameTitle.centerYAnchor),
            textFieldName.leadingAnchor.constraint(equalTo: labelNameTitle.trailingAnchor),
            textFieldName.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: 16),
            
            labelEmailTitle.topAnchor.constraint(equalTo: labelNameTitle.bottomAnchor, constant: 16),
            labelEmailTitle.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 16),
            labelEmailTitle.widthAnchor.constraint(equalToConstant: 80),
            
            textFieldEmail.centerYAnchor.constraint(equalTo: labelEmailTitle.centerYAnchor),
            textFieldEmail.leadingAnchor.constraint(equalTo: labelEmailTitle.trailingAnchor),
            textFieldEmail.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: 16),
            
            labelPhoneTitle.topAnchor.constraint(equalTo: labelEmailTitle.bottomAnchor, constant: 16),
            labelPhoneTitle.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 16),
            labelPhoneTitle.widthAnchor.constraint(equalToConstant: 80),
            
            textFieldPhone.centerYAnchor.constraint(equalTo: labelPhoneTitle.centerYAnchor),
            textFieldPhone.leadingAnchor.constraint(equalTo: labelPhoneTitle.trailingAnchor),
            textFieldPhone.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: 16),
            
            ButtonSave.topAnchor.constraint(equalTo: textFieldPhone.bottomAnchor, constant: 16),
            ButtonSave.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            
            contentLayoutGuide.bottomAnchor.constraint(equalTo: ButtonSave.bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//
//  AddContactView.swift
//  WA4_Han_4385
//
//  Created by Jiali Han on 10/2/24.
//

import UIKit

class AddContactView: UIView {
    
    var textFieldName: UITextField!
    
    var buttonTakePhoto: UIButton!
    var labelPhoto: UILabel!
    
    var textFieldEmail: UITextField!
    
    var textFieldPhoneNumber: UITextField!
    var buttonSelectPhoneType: UIButton!
    
    var textFieldAddress: UITextField!
    var textFieldCityAndState: UITextField!
    var textFieldZip: UITextField!
    
    var buttonSave: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //setting the background color...
        self.backgroundColor = .white
        
        setTextFieldName()
        
        setButtonTakePhoto()
        setLabelPhoto()
        
        setTextFieldEmail()
        
        setTextFieldPhoneNumber()
        setButtonSelectPhoneType()
        
        setTextFieldAddress()
        setTextFieldCityAndState()
        setTextFieldZip()
        
        setButtonSave()
        
        initConstraints()
    }
    
    func setTextFieldName() {
        textFieldName = UITextField()
        textFieldName.placeholder = "Name"
        textFieldName.borderStyle = .roundedRect
        textFieldName.translatesAutoresizingMaskIntoConstraints = false;
        self.addSubview(textFieldName)
    }
    
    func setButtonTakePhoto(){
        // Fixed why edit screen's button for take photo not showing picked image
        // https://stackoverflow.com/questions/62379150/why-is-button-background-changing-to-blue-when-button-selected
        // https://stackoverflow.com/questions/47468313/uibutton-system-vs-custom-in-terms-of-colors-images-states-etc
        buttonTakePhoto = UIButton(type: .custom)
        buttonTakePhoto.setTitle("", for: .normal)
        buttonTakePhoto.setImage(UIImage(systemName: "camera.fill"), for: .normal)
        buttonTakePhoto.contentHorizontalAlignment = .fill
        buttonTakePhoto.contentVerticalAlignment = .fill
            
        buttonTakePhoto.imageView?.contentMode = .scaleAspectFit
        buttonTakePhoto.translatesAutoresizingMaskIntoConstraints = false
        buttonTakePhoto.showsMenuAsPrimaryAction = true
        self.addSubview(buttonTakePhoto)
    }
    
    func setLabelPhoto() {
        labelPhoto = UILabel()
        labelPhoto.text = "Photo"
        labelPhoto.textAlignment = .left
        labelPhoto.translatesAutoresizingMaskIntoConstraints = false
        labelPhoto.textColor = .lightGray
        self.addSubview(labelPhoto)
    }
    
    func setTextFieldEmail() {
        textFieldEmail = UITextField();
        textFieldEmail.placeholder = "Email"
        textFieldEmail.borderStyle = .roundedRect
        // set the keypad type of the TextField to 'emailAddress'
        textFieldEmail.keyboardType = .emailAddress
        textFieldEmail.translatesAutoresizingMaskIntoConstraints = false;
        self.addSubview(textFieldEmail)
    }
    
    func setButtonSelectPhoneType(){
        buttonSelectPhoneType = UIButton(type: .system)
        buttonSelectPhoneType.setTitle("Home", for: .normal)
        //MARK: the on-tap primary action will pop up the menu...
        buttonSelectPhoneType.showsMenuAsPrimaryAction = true
        buttonSelectPhoneType.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonSelectPhoneType)
    }
    
    func setTextFieldPhoneNumber() {
        textFieldPhoneNumber = UITextField();
        textFieldPhoneNumber.placeholder = "Phone number";
        textFieldPhoneNumber.borderStyle = .roundedRect
        // set the keypad type of the TextField to 'phonePad'
        textFieldPhoneNumber.keyboardType = .phonePad
        textFieldPhoneNumber.translatesAutoresizingMaskIntoConstraints = false;
        self.addSubview(textFieldPhoneNumber)
    }
    
    func setTextFieldAddress() {
        textFieldAddress = UITextField();
        textFieldAddress.placeholder = "Address"
        textFieldAddress.borderStyle = .roundedRect
        textFieldAddress.translatesAutoresizingMaskIntoConstraints = false;
        self.addSubview(textFieldAddress)
    }
    
    func setTextFieldCityAndState() {
        textFieldCityAndState = UITextField()
        textFieldCityAndState.placeholder = "City, State"
        textFieldCityAndState.borderStyle = .roundedRect
        textFieldCityAndState.translatesAutoresizingMaskIntoConstraints = false;
        self.addSubview(textFieldCityAndState)
    }
    
    func setTextFieldZip() {
        textFieldZip = UITextField();
        textFieldZip.placeholder = "ZIP"
        textFieldZip.borderStyle = .roundedRect
        // keypad type of the TextFiles should be 'numberPad'
        textFieldZip.keyboardType = .numberPad
        textFieldZip.translatesAutoresizingMaskIntoConstraints = false;
        self.addSubview(textFieldZip)
    }
    
    func setButtonSave() {
        buttonSave = UIButton(type: .system)
        buttonSave.setTitle("Save", for: .normal)
        //MARK: the on-tap primary action will pop up the menu...
        buttonSave.showsMenuAsPrimaryAction = true
        buttonSave.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonSave)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            // Name
            textFieldName.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 64),
            textFieldName.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldName.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textFieldName.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            // Button Take Photo
            buttonTakePhoto.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: 20),
            buttonTakePhoto.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            buttonTakePhoto.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            buttonTakePhoto.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            //MARK: setting buttonTakePhoto's height and width..
            buttonTakePhoto.widthAnchor.constraint(equalToConstant: 100),
            buttonTakePhoto.heightAnchor.constraint(equalToConstant: 100),

            
            // Label to take photo
            labelPhoto.topAnchor.constraint(equalTo: buttonTakePhoto.bottomAnchor, constant: 2),
            labelPhoto.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            // Email
            textFieldEmail.topAnchor.constraint(equalTo: labelPhoto.bottomAnchor, constant: 16),
            textFieldEmail.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldEmail.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textFieldEmail.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            // MARK: SAME LINE has 1) Button Select Phone Type 2) Phone Number
            
            // Phone Number
            textFieldPhoneNumber.centerYAnchor.constraint(equalTo: buttonSelectPhoneType.centerYAnchor),
            textFieldPhoneNumber.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            // Make the textFieldPhoneNumber's trailing anchor equal to the button's leading anchor with some spacing
            textFieldPhoneNumber.trailingAnchor.constraint(equalTo: buttonSelectPhoneType.leadingAnchor, constant: -8),

            // Button Select Phone Type
            buttonSelectPhoneType.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 20),
            buttonSelectPhoneType.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            buttonSelectPhoneType.widthAnchor.constraint(equalToConstant: 80),
            
            // Address
            textFieldAddress.topAnchor.constraint(equalTo: buttonSelectPhoneType.bottomAnchor, constant: 20),
            textFieldAddress.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldAddress.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textFieldAddress.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            // City and State
            textFieldCityAndState.topAnchor.constraint(equalTo: textFieldAddress.bottomAnchor, constant: 20),
            textFieldCityAndState.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldCityAndState.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textFieldCityAndState.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            // Zip
            textFieldZip.topAnchor.constraint(equalTo: textFieldCityAndState.bottomAnchor, constant: 20),
            textFieldZip.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldZip.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textFieldZip.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            buttonSave.topAnchor.constraint(equalTo: textFieldZip.bottomAnchor, constant: 64),
            buttonSave.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            buttonSave.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            buttonSave.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  FirstScreenView.swift
//  WA3_Han_4385
//
//  Created by Jiali Han on 9/23/24.
//

import UIKit

class FirstScreenView: UIView {

    var labelAppName: UILabel!
    var textFieldName: UITextField!
    var textFieldEmail: UITextField!
    var labelAddPhoneType: UILabel!
    var labelSelectPhoneType: UILabel!
    var pickerPhoneType: UIPickerView!
    var textFieldPhoneNumber: UITextField!
    var textFieldAddress: UITextField!
    var textFieldCityAndState: UITextField!
    var textFieldZip: UITextField!
    var buttonSubmit: UIButton!
   
   override init(frame: CGRect) {
       super.init(frame: frame)
       
       //setting the background color...
       self.backgroundColor = .white
       
       setLabelAppName()
       setTextFieldName()
       setTextFieldEmail()
       setLabelAddPhoneType()
       setLabelSelectPhoneType()
       setPickerPhoneType()
       setTextFieldPhoneNumber()
       setTextFieldAddress()
       setTextFieldCityAndState()
       setTextFieldZip()
       setButtonSubmit()
       
       initConstraints()
       
   }
   
   func setLabelAppName() {
       labelAppName = UILabel()
       // title should be “Create Profile”
       labelAppName.text = "Create Profile"
       labelAppName.font = labelAppName.font.withSize(28)
       labelAppName.textAlignment = .center;
       labelAppName.translatesAutoresizingMaskIntoConstraints = false;
       self.addSubview(labelAppName)
   }
   
   func setTextFieldName() {
       textFieldName = UITextField()
       textFieldName.placeholder = "Name"
       textFieldName.borderStyle = .roundedRect
       textFieldName.translatesAutoresizingMaskIntoConstraints = false;
       self.addSubview(textFieldName)
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
   
   func setLabelAddPhoneType() {
       labelAddPhoneType = UILabel();
       labelAddPhoneType.text = "Add Phone"
       // font sizes for “Add Phone” and “Select Type” are different
       labelAddPhoneType.font = labelAddPhoneType.font.withSize(24)
       labelAddPhoneType.textAlignment = .center;
       labelAddPhoneType.translatesAutoresizingMaskIntoConstraints = false;
       self.addSubview(labelAddPhoneType)
   }
   
   func setLabelSelectPhoneType() {
       labelSelectPhoneType = UILabel();
       labelSelectPhoneType.text = "Select Type:"
       labelSelectPhoneType.font = labelSelectPhoneType.font.withSize(20)
       labelSelectPhoneType.textAlignment = .center;
       labelSelectPhoneType.translatesAutoresizingMaskIntoConstraints = false;
       self.addSubview(labelSelectPhoneType)
   }
   
   func setPickerPhoneType() {
       pickerPhoneType = UIPickerView();
       pickerPhoneType.isUserInteractionEnabled = true
       pickerPhoneType.translatesAutoresizingMaskIntoConstraints = false;
       self.addSubview(pickerPhoneType)
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
   
   func setButtonSubmit() {
       buttonSubmit = UIButton(type: .system)
       buttonSubmit.setTitle("Show Profile", for: .normal)
       // set text size of button
       // Reference: https://stackoverflow.com/questions/35602174/how-can-i-change-text-size-of-button
       buttonSubmit.titleLabel?.font = UIFont(name: "Helvetica", size: 20)
       buttonSubmit.translatesAutoresizingMaskIntoConstraints = false
       self.addSubview(buttonSubmit)
   }
   
   func initConstraints() {
       NSLayoutConstraint.activate([
            // App Name
            labelAppName.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 12),
            labelAppName.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
        
            // Name
            textFieldName.topAnchor.constraint(equalTo: labelAppName.bottomAnchor, constant: 32),
            textFieldName.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldName.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            textFieldName.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -24),
           
            // Email
            textFieldEmail.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: 16),
            textFieldEmail.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldEmail.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            textFieldEmail.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -24),
           
            // Add Phone
            labelAddPhoneType.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 16),
            labelAddPhoneType.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            labelAddPhoneType.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            labelAddPhoneType.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -24),
           
            // Select Type
            labelSelectPhoneType.topAnchor.constraint(equalTo: labelAddPhoneType.bottomAnchor, constant: 16),
            labelSelectPhoneType.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
           
            // Picker Phone Type
            pickerPhoneType.topAnchor.constraint(equalTo: labelSelectPhoneType.bottomAnchor, constant: 16),
            pickerPhoneType.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            pickerPhoneType.heightAnchor.constraint(equalToConstant: 120),
           
            textFieldPhoneNumber.topAnchor.constraint(equalTo: pickerPhoneType.bottomAnchor, constant: 16),
            textFieldPhoneNumber.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldPhoneNumber.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            textFieldPhoneNumber.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -24),
           
            // Address
            textFieldAddress.topAnchor.constraint(equalTo: textFieldPhoneNumber.bottomAnchor, constant: 20),
            textFieldAddress.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldAddress.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            textFieldAddress.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -24),
           
            // City and State
            textFieldCityAndState.topAnchor.constraint(equalTo: textFieldAddress.bottomAnchor, constant: 20),
            textFieldCityAndState.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldCityAndState.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            textFieldCityAndState.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -24),
           
            // Zip
            textFieldZip.topAnchor.constraint(equalTo: textFieldCityAndState.bottomAnchor, constant: 20),
            textFieldZip.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldZip.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            textFieldZip.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -24),
           
            // Submit
            buttonSubmit.topAnchor.constraint(equalTo: textFieldZip.bottomAnchor, constant: 60),
            buttonSubmit.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            buttonSubmit.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            buttonSubmit.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -24),
       ])
   }
   
   required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
}

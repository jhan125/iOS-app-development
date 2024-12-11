//
//  AddContactView.swift
//  WA5_Han_4385
//
//  Created by Jiali Han on 10/11/24.
//

import UIKit

class AddContactView: UIView {

    var nameField: UITextField!;
        var emailField: UITextField!;
        
        var buttonTakePhoto: UIButton!
        var buttonSelectType: UIButton!
        
        var phoneNumberField: UITextField!;
        var addressField: UITextField!;
        var cityAndStateField: UITextField!;
        var zipField: UITextField!;
        var submitButton: UIButton!;
        
        var photoLabel:UILabel!;
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            //setting the background color...
            self.backgroundColor = .white
            
            setphotoLabel()
            setNameField()
            setEmailField()
            setbuttonTakePhoto()
            setButtonSelectType()
            setPhoneNumberField()
            setAddressField()
            setCityAndStateField()
            setzipField()
            
            setSubmitButton()
            
            initConstraints()
            
        }
        
        func setphotoLabel() {
            photoLabel = UILabel()
            photoLabel.text = "Photo"
            photoLabel.translatesAutoresizingMaskIntoConstraints = false;
            photoLabel.alpha = 0.5
            self.addSubview(photoLabel)
        }
        
        func setNameField() {
            nameField = UITextField()
            nameField.placeholder = "Name"
            nameField.borderStyle = .roundedRect
            nameField.translatesAutoresizingMaskIntoConstraints = false;
            self.addSubview(nameField)
        }
        
        func setEmailField() {
            emailField = UITextField();
            emailField.placeholder = "Email"
            emailField.borderStyle = .roundedRect
            emailField.keyboardType = .emailAddress
            emailField.translatesAutoresizingMaskIntoConstraints = false;
            self.addSubview(emailField)
        }
        
        func setbuttonTakePhoto() {
            buttonTakePhoto = UIButton()
            
            buttonTakePhoto.setTitle("", for: .normal)  // no title
            buttonTakePhoto.setImage(UIImage(systemName: "camera.on.rectangle"), for: .normal)
            
            buttonTakePhoto.contentHorizontalAlignment = .fill
            buttonTakePhoto.contentVerticalAlignment = .fill
            buttonTakePhoto.imageView?.contentMode = .scaleAspectFit
            
            buttonTakePhoto.showsMenuAsPrimaryAction = true
            buttonTakePhoto.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(buttonTakePhoto)
        }
        
        func setButtonSelectType() {
            buttonSelectType = UIButton(type: .system)
            buttonSelectType.setTitle("Home", for: .normal)

            //MARK: the on-tap primary action will pop up the menu...
            buttonSelectType.showsMenuAsPrimaryAction = true
            buttonSelectType.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(buttonSelectType)
        }
        
        
        func setPhoneNumberField() {
            phoneNumberField = UITextField();
            phoneNumberField.placeholder = "Phone number";
            phoneNumberField.borderStyle = .roundedRect
            phoneNumberField.keyboardType = .phonePad
            phoneNumberField.translatesAutoresizingMaskIntoConstraints = false;
            self.addSubview(phoneNumberField)
        }
        
        func setAddressField() {
            addressField = UITextField();
            addressField.placeholder = "Address"
            addressField.borderStyle = .roundedRect
            addressField.translatesAutoresizingMaskIntoConstraints = false;
            self.addSubview(addressField)
        }
        
        func setCityAndStateField() {
            cityAndStateField = UITextField()
            cityAndStateField.placeholder = "City, State"
            cityAndStateField.borderStyle = .roundedRect
            cityAndStateField.translatesAutoresizingMaskIntoConstraints = false;
            self.addSubview(cityAndStateField)
        }
        
        func setzipField() {
            zipField = UITextField();
            zipField.placeholder = "ZIP"
            zipField.borderStyle = .roundedRect
            zipField.keyboardType = .phonePad
            zipField.translatesAutoresizingMaskIntoConstraints = false;
            self.addSubview(zipField)
        }
        
        func setSubmitButton() {
            submitButton = UIButton(type: .system)
            submitButton.setTitle("Save", for: .normal)

            //MARK: the on-tap primary action will pop up the menu...
            submitButton.showsMenuAsPrimaryAction = true
            submitButton.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(submitButton)
        }
        
        
        func initConstraints() {
            NSLayoutConstraint.activate([
                nameField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 64),
                nameField.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                nameField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
                nameField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
                
                buttonTakePhoto.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 20),
                buttonTakePhoto.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                buttonTakePhoto.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
                buttonTakePhoto.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
                buttonTakePhoto.widthAnchor.constraint(equalToConstant: 100),
                buttonTakePhoto.heightAnchor.constraint(equalToConstant: 100),
                
                photoLabel.topAnchor.constraint(equalTo: buttonTakePhoto.bottomAnchor, constant: 2),
                photoLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                
                emailField.topAnchor.constraint(equalTo: photoLabel.bottomAnchor, constant: 16),
                emailField.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                emailField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
                emailField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
                
                // Same line
                buttonSelectType.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 20),
                buttonSelectType.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
                buttonSelectType.widthAnchor.constraint(equalToConstant: 80),
                
                phoneNumberField.centerYAnchor.constraint(equalTo: buttonSelectType.centerYAnchor),
                phoneNumberField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
                phoneNumberField.trailingAnchor.constraint(equalTo: buttonSelectType.leadingAnchor, constant: -8),

                //

                addressField.topAnchor.constraint(equalTo: buttonSelectType.bottomAnchor, constant: 20),
                addressField.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                addressField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
                addressField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
                
                cityAndStateField.topAnchor.constraint(equalTo: addressField.bottomAnchor, constant: 20),
                cityAndStateField.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                cityAndStateField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
                cityAndStateField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
                
                zipField.topAnchor.constraint(equalTo: cityAndStateField.bottomAnchor, constant: 20),
                zipField.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                zipField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
                zipField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
                
                submitButton.topAnchor.constraint(equalTo: zipField.bottomAnchor, constant: 64),
                submitButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                submitButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
                submitButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            ])
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

    }

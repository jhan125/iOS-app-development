//
//  ContactDetailView.swift
//  WA5_Han_4385
//
//  Created by Jiali Han on 10/11/24.
//

import UIKit

class ContactDetailView: UIView {

    var imagePhoto: UIImageView!;
        var labelName: UILabel!;
        var labelEmail: UILabel!;
        var labelPhone: UILabel!;
        var labelAddressHeader: UILabel!;
        var labelAddress: UILabel!;
        var labelCityAndStates: UILabel!;
        var labelZip: UILabel!;
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            //setting the background color...
            self.backgroundColor = .white
            
            setImagePhoto()
            setLabelName()
            setLabelEmail()
            setLabelPhone()
            setLabelAddressHeader()
            setLabelAddress()
            setLabelCityAndStates()
            setLabelZip()
            
            initConstraints()
        }
        
        func setImagePhoto() {
            imagePhoto = UIImageView()
            imagePhoto.image = UIImage(systemName: "photo")
            imagePhoto.contentMode = .scaleToFill
            imagePhoto.clipsToBounds = true
            imagePhoto.layer.cornerRadius = 10
            imagePhoto.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(imagePhoto)
        }
        
        func setLabelName() {
            labelName = UILabel()
            labelName.font = UIFont.boldSystemFont(ofSize: 32);
            labelName.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(labelName)
        }
        
        func setLabelEmail() {
            labelEmail = UILabel()
            labelEmail.font = UIFont.systemFont(ofSize: 20);
            labelEmail.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(labelEmail)
        }
        
        func setLabelPhone() {
            labelPhone = UILabel()
            labelPhone.font = UIFont.systemFont(ofSize: 20);
            labelPhone.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(labelPhone)
        }
        
        func setLabelAddressHeader() {
            labelAddressHeader = UILabel()
            labelAddressHeader.text = "Address:"
            labelAddressHeader.font = UIFont.boldSystemFont(ofSize: 20);
            labelAddressHeader.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(labelAddressHeader)
        }
        
        func setLabelAddress() {
            labelAddress = UILabel()
            labelAddress.font = UIFont.systemFont(ofSize: 20);
            labelAddress.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(labelAddress)
        }
        
        func setLabelCityAndStates() {
            labelCityAndStates = UILabel()
            labelCityAndStates.font = UIFont.systemFont(ofSize: 20);
            labelCityAndStates.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(labelCityAndStates)
        }
        
        func setLabelZip() {
            labelZip = UILabel()
            labelZip.font = UIFont.systemFont(ofSize: 20);
            labelZip.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(labelZip)
        }
        
        func initConstraints () {
            NSLayoutConstraint.activate([
                imagePhoto.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 36),
                imagePhoto.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                imagePhoto.widthAnchor.constraint(equalToConstant: 100),
                imagePhoto.heightAnchor.constraint(equalToConstant: 100),
                
                labelName.topAnchor.constraint(equalTo: imagePhoto.bottomAnchor, constant: 72),
                labelName.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                
                labelEmail.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 16),
                labelEmail.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                
                labelPhone.topAnchor.constraint(equalTo: labelEmail.bottomAnchor, constant: 16),
                labelPhone.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                
                labelAddressHeader.topAnchor.constraint(equalTo: labelPhone.bottomAnchor, constant: 16),
                labelAddressHeader.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                
                labelAddress.topAnchor.constraint(equalTo: labelAddressHeader.bottomAnchor, constant: 8),
                labelAddress.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                
                labelCityAndStates.topAnchor.constraint(equalTo: labelAddress.bottomAnchor, constant: 8),
                labelCityAndStates.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                
                labelZip.topAnchor.constraint(equalTo: labelCityAndStates.bottomAnchor, constant: 8),
                labelZip.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            ])
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        

    }

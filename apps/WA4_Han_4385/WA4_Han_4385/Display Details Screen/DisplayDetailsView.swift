//
//  DisplayDetailsView.swift
//  WA4_Han_4385
//
//  Created by Jiali Han on 10/2/24.
//

import UIKit

class DisplayDetailsView: UIView {

    var labelName: UILabel!
    var imagePhoto: UIImageView!;
    var labelEmail: UILabel!
    var labelPhone: UILabel!
    var labelAddressTitle: UILabel!;
    var labelAddress: UILabel!
    var labelCityAndState: UILabel!
    var labelZip: UILabel!
        
    //MARK: View initializer...
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //setting the background color...
        self.backgroundColor = .white
        
        setLabelName()
        setImagePhoto()
        setLabelEmail()
        setLabelPhone()
        setLabelAddressTitle()
        setLabelAddress()
        setLabelCityAndStates()
        setLabelZip()
        
        initConstraints()
    }
        
    //MARK: initializing the UI elements...
    func setLabelName() {
        labelName = UILabel()
        labelName.textAlignment = .center
        labelName.font = UIFont.boldSystemFont(ofSize: 32);
        labelName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelName)
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

    func setLabelEmail() {
        labelEmail = UILabel()
        labelEmail.textAlignment = .center
        labelEmail.font = UIFont.systemFont(ofSize: 20);
        labelEmail.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelEmail)
    }
    
    func setLabelPhone() {
        labelPhone = UILabel()
        labelPhone.textAlignment = .center
        labelPhone.font = UIFont.systemFont(ofSize: 20);
        labelPhone.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelPhone)
    }
    
    func setLabelAddressTitle() {
        labelAddressTitle = UILabel()
        labelAddressTitle.textAlignment = .center
        labelAddressTitle.text = "Address:"
        labelAddressTitle.font = UIFont.boldSystemFont(ofSize: 26);
        labelAddressTitle.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelAddressTitle)
    }
    
    func setLabelAddress() {
        labelAddress = UILabel()
        labelAddress.textAlignment = .center
        labelAddress.font = UIFont.systemFont(ofSize: 20);
        labelAddress.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelAddress)
    }
    
    func setLabelCityAndStates() {
        labelCityAndState = UILabel()
        labelCityAndState.textAlignment = .center
        labelCityAndState.font = UIFont.systemFont(ofSize: 20);
        labelCityAndState.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelCityAndState)
    }
    
    func setLabelZip() {
        labelZip = UILabel()
        labelZip.textAlignment = .center
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
            
            labelName.topAnchor.constraint(equalTo: imagePhoto.safeAreaLayoutGuide.bottomAnchor, constant: 40),
            labelName.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            labelEmail.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 30),
            labelEmail.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            labelPhone.topAnchor.constraint(equalTo: labelEmail.bottomAnchor, constant: 16),
            labelPhone.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            labelAddressTitle.topAnchor.constraint(equalTo: labelPhone.bottomAnchor, constant: 30),
            labelAddressTitle.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            labelAddress.topAnchor.constraint(equalTo: labelAddressTitle.bottomAnchor, constant: 8),
            labelAddress.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            labelCityAndState.topAnchor.constraint(equalTo: labelAddress.bottomAnchor, constant: 8),
            labelCityAndState.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            labelZip.topAnchor.constraint(equalTo: labelCityAndState.bottomAnchor, constant: 8),
            labelZip.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

//
//  DisplayView.swift
//  WA3_Han_4385
//
//  Created by Jiali Han on 9/23/24.
//

import UIKit

class DisplayView: UIView {

    // 6 Labels to display the ‘name,’ ‘email,’ ‘phone’ (with the type of number), ‘address,’ ‘city, state,’ and ‘zip’ of the profile.
    var labelName: UILabel!
    var labelEmail: UILabel!
    var labelPhone: UILabel!
    var labelAddress: UILabel!
    var labelCityAndState: UILabel!
    var labelZip: UILabel!
    //  an ImageView to display an image corresponding to the phone number type the user selected (cell, work, or home).
    var imagePhone: UIImageView!
        
    //MARK: View initializer...
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //setting the background color...
        self.backgroundColor = .white
        
        setLabelName()
        setLabelEmail()
        setLabelPhone()
        setLabelAddress()
        setLabelCityAndStates()
        setLabelZip()
        setImagePhone()
        
        initConstraints()
    }
        
    //MARK: initializing the UI elements...
    func setLabelName() {
        labelName = UILabel()
        labelName.textAlignment = .left
        labelName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelName)
    }
    
    func setLabelEmail() {
        labelEmail = UILabel()
        labelEmail.textAlignment = .left
        labelEmail.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelEmail)
    }
    
    func setLabelPhone() {
        labelPhone = UILabel()
        labelPhone.textAlignment = .left
        labelPhone.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelPhone)
    }
    
    func setLabelAddress() {
        labelAddress = UILabel()
        labelAddress.textAlignment = .left
        labelAddress.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelAddress)
    }
    
    func setLabelCityAndStates() {
        labelCityAndState = UILabel()
        labelCityAndState.textAlignment = .left
        labelCityAndState.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelCityAndState)
    }
    
    func setLabelZip() {
        labelZip = UILabel()
        labelZip.textAlignment = .left
        labelZip.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelZip)
    }
    
    func setImagePhone() {
        imagePhone = UIImageView()
        imagePhone.contentMode = .scaleAspectFit
        imagePhone.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imagePhone)
    }

    func initConstraints () {
        NSLayoutConstraint.activate([
            labelName.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 36),
            labelName.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            labelName.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            labelName.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            labelEmail.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 16),
            labelEmail.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            labelEmail.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            labelEmail.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            labelPhone.topAnchor.constraint(equalTo: labelEmail.bottomAnchor, constant: 16),
            labelPhone.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            labelPhone.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            labelPhone.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            labelAddress.topAnchor.constraint(equalTo: labelPhone.bottomAnchor, constant: 16),
            labelAddress.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            labelAddress.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            labelAddress.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            labelCityAndState.topAnchor.constraint(equalTo: labelAddress.bottomAnchor, constant: 16),
            labelCityAndState.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            labelCityAndState.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            labelCityAndState.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            labelZip.topAnchor.constraint(equalTo: labelCityAndState.bottomAnchor, constant: 16),
            labelZip.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            labelZip.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            labelZip.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            imagePhone.topAnchor.constraint(equalTo: labelZip.bottomAnchor, constant: 20),
            imagePhone.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

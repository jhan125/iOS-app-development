//
//  Contact.swift
//  CocoaPods
//
//  Created by Jiali Han on 10/21/24.
//

import Foundation

//MARK: struct for a contact...
struct Contact{
    var name:String
    var email:String
    var phone: Int
    
    init(name: String, email: String, phone: Int) {
        self.name = name
        self.email = email
        self.phone = phone
    }
}

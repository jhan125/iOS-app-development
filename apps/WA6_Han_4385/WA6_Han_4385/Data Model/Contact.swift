//
//  Contact.swift
//  WA6_Han_4385
//
//  Created by Jiali Han on 10/21/24.
//

import Foundation
// Using a struct/class to send data between screens
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

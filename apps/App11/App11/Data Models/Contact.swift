//
//  Contact.swift
//  App11
//
//  Created by Sakib Miazi on 5/26/23.
//

import Foundation

//MARK: struct for a contact...
struct Contact: Codable{
    var name:String
    var email:String
    var phone:Int
    
    init(name: String, email: String, phone: Int) {
        self.name = name
        self.email = email
        self.phone = phone
    }
}

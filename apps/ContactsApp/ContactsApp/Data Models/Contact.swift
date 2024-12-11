//
//  Contact.swift
//  ContactsApp
//
//  Created by Jiali Han on 11/5/24.
//
import Foundation
import FirebaseFirestore

struct Contact: Codable{
    @DocumentID var id: String?
    var name: String
    var email: String
    var phone: Int
    
    init(name: String, email: String, phone: Int) {
        self.name = name
        self.email = email
        self.phone = phone
    }
}


//
//  Message.swift
//  FirestoreApp
//
//  Created by Jiali Han on 11/5/24.
//
import Foundation

struct Message: Codable {
    var Received: Bool
    var Time: Date
    var Text: String
}


struct MessageRoom: Codable {
    // the name of this Room will be the guest's ID
    var guest: User
    var Messages: [Message]
}

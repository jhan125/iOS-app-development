//
//  NotificationNames.swift
//  WA7_Han_4385
//
//  Created by Jiali Han on 10/29/24.
//

import Foundation

extension Notification.Name{
    static let tokenReceived = Notification.Name("tokenRecieved")
    static let notesReceived = Notification.Name("notesRecieved")
    
    static let posted = Notification.Name("posted")
    static let deleted = Notification.Name("deleted")
    static let edited = Notification.Name("edited")
    static let deletedForEditing = Notification.Name("deletedForEditing")
}

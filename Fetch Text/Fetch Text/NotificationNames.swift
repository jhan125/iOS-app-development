//
//  NotificationNames.swift
//  Fetch Text
//
//  Created by Jiali Han on 10/18/24.
//

import Foundation

// extending Notification.Name class, and defining new static names inside it.
// We used only one observer with the identity/name "textFromSecondScreen." 
// textFromSecondScreen static constant is holding that identifier.
extension Notification.Name{
    static let textFromScondScreen = Notification.Name("textFromSecondScreen")
}

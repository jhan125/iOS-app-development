//
//  Contacts.swift
//  WA5_Han_4385
//
//  Created by Jiali Han on 10/11/24.
//

import Foundation
import PhotosUI

public struct Contacts {
    var name: String?
    var pickedImage:UIImage?
    var email: String?
    var phoneType: String?
    var phoneNumber: String?;
    var address: String?;
    var cityAndState: String?;
    var zip: String?;
    
    init(name: String? = nil, email: String? = nil, phoneType: String? = nil, phoneNumber: String? = nil,
         address: String? = nil, cityAndState: String? = nil, zip: String? = nil, pickedImage: UIImage? = nil) {
        
        self.name = name
        self.email = email
        self.phoneType = phoneType
        self.phoneNumber = phoneNumber
        self.address = address
        self.cityAndState = cityAndState
        self.zip = zip
        self.pickedImage = pickedImage
    }
}

//
//  ContactNames.swift
//  App11
//
//  Created by Sakib Miazi on 5/26/23.
//

import Foundation

struct ContactName: Codable{
    let name:String
}

struct ContactNames: Codable{
    let contacts: [ContactName]
}

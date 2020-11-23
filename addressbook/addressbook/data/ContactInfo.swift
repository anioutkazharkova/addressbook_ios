//
//  ContactInfo.swift
//  addressbook
//
//  Created by Anna Zharkova on 23.11.2020.
//

import Foundation

struct ContactInfo {
    let firstName: String
    let lastName: String
    let phones: [Phone]
    let avatarData: Data? 
}

struct Phone {
    let phoneType: PhoneTypes
    let phoneNumber: String
}

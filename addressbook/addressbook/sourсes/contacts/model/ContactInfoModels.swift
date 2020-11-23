//
//  DataModel.swift
//  addressbook
//
//  Created by Anna Zharkova on 24.11.2020.
//

import Foundation

struct ContactItemResponse {
    let item: ContactInfo
}
struct PhoneModel{
    let type: String
    let phone: String
    
    init(phone: Phone) {
        self.type = phone.phoneType.value
        self.phone = phone.phoneNumber
    }
}

struct ContactItemModel {
    let name: String
    let phones: [PhoneModel]
    let avatarData: Data?
    
    init(item: ContactInfo) {
        self.name = "\(item.firstName) \(item.lastName)"
        self.avatarData = item.avatarData
        self.phones = item.phones.map{PhoneModel(phone: $0)}
    }
}

struct ContactInfoViewModel {
    let item: ContactItemModel
}

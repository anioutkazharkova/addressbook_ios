//
//  ContactsListModel.swift
//  addressbook
//
//  Created by Anna Zharkova on 23.11.2020.
//

import Foundation

enum ContactsResponse {
    case error(error: Error)
    case success(data: [ContactInfo])
}
struct ContactModel {
    let name: String
    let phone: String
    let avatarData: Data?
    
    init(item: ContactInfo) {
        self.name = "\(item.firstName) \(item.lastName)"
        if let mainPhone = (item.phones.filter{$0.phoneType == .main}).first {
            self.phone = "Main phone: \(mainPhone.phoneNumber)"
        } else {
            self.phone = "Main phone: \(item.phones.first?.phoneNumber ?? "--")"
        }
        self.avatarData = item.avatarData
    }
}
struct  ContactsListViewModel {
    let items: [ContactModel]
}


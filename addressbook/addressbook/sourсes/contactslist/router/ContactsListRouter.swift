//
//  ContactsListRouter.swift
//  addressbook
//
//  Created by Anna Zharkova on 23.11.2020.
//

import Foundation

class ContactsListRouter : IRouter {
    func performMove(transition: Transition, _ dataSource: IDataSource?) {
        switch transition {
        case .contact:
            if let data = dataSource?.data as? ContactInfo {
                Navigator.shared.open(screen: ContactInfoVC.self, data)
            }
        default:
            break
        }
    }
}

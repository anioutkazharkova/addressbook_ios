//
//  ServiceConfig.swift
//  addressbook
//
//  Created by Anna Zharkova on 23.11.2020.
//

import Foundation

class ServiceConfig {
    class func register() {
        ServiceLocator.shared.addService(service: ContactsManager())
    }
}

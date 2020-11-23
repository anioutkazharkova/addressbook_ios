//
//  ModuleConfig.swift
//  addressbook
//
//  Created by Anna Zharkova on 23.11.2020.
//

import Foundation
import UIKit

protocol IConfugator: class {
    func createScreen(_ data: Any?)->UIViewController
}

class ModuleConfig{
    private init(){}
    static let shared = ModuleConfig()
    
    func config<T:UIViewController>(screen: T.Type)->IConfugator? {
        if screen == ContactsListVC.self {
            return ContactsListConfigurator()
        }
        if screen == ContactInfoVC.self {
            return ContactInfoConfigurator()
        }
        return nil
    }
}

//
//  ContactsListConfigurator.swift
//  addressbook
//
//  Created by Anna Zharkova on 23.11.2020.
//

import Foundation
import UIKit

class ContactsListConfigurator : IConfugator {
    func createScreen(_ data: Any?) -> UIViewController {
        let vc = ContactsListVC()
        let presenter = ContactsListPresenter()
        let router = ContactsListRouter()
        
        let interactor = ContactsListInteractor(contactsManager: ServiceLocator.shared.getService(type: ContactsManager.self))
        
        interactor.output = presenter
        presenter.output = vc
        vc.output = interactor
        vc.router = router
        
        
        return vc
    }
}

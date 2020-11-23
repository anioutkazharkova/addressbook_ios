//
//  ContactInfoConfigurator.swift
//  addressbook
//
//  Created by Anna Zharkova on 24.11.2020.
//

import Foundation
import UIKit

class ContactInfoConfigurator : IConfugator {
    func createScreen(_ data: Any?) -> UIViewController {
        let vc = ContactInfoVC()
        let presenter = ContactInfoPresenter()
        //let router = ContactsListRouter()
        
        let interactor = ContactInfoInteractor()
        if let data = data as? ContactInfo {
            interactor.item = data
        }
        interactor.output = presenter
        presenter.output = vc
        vc.output = interactor
      //  vc.router = router
        
        
        return vc
    }
}

//
//  ContactInfoInteractor.swift
//  addressbook
//
//  Created by Anna Zharkova on 24.11.2020.
//

import Foundation

class ContactInfoInteractor : IContactInfoInteractor  {
    var item: ContactInfo? = nil
    
    var output: IContactInfoPresenter?
    
    func loadContent() {
        if let item = item {
            self.output?.setup(response: ContactItemResponse(item: item))
        }
    }
    
    
}

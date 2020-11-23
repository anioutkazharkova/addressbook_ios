//
//  ContactInfoPresenter.swift
//  addressbook
//
//  Created by Anna Zharkova on 24.11.2020.
//

import Foundation

class ContactInfoPresenter: IContactInfoPresenter {
    weak var output: IContactInfoView?
    
    
    func setup(response: ContactItemResponse) {
        self.output?.setup(model:
                        ContactInfoViewModel(item:
                        ContactItemModel(item: response.item)))
    }
}

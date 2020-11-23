//
//  ContactsListPresenter.swift
//  addressbook
//
//  Created by Anna Zharkova on 23.11.2020.
//

import Foundation

class ContactsListPresenter : IContactsListPresenter {
    weak var output: IContactsListView?
    
    func setup(response: ContactsResponse) {
        switch response {
        case .success(let data):
            self.output?.setup(model: ContactsListViewModel(items: data.map{ContactModel(item: $0)}))
        case .error(let error):
            if error is DeniedAccessError {
                self.output?.showSettings()
            }
            print(error.localizedDescription)
        }
    }
    
}

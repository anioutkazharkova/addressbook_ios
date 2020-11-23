//
//  ContactsListInteractor.swift
//  addressbook
//
//  Created by Anna Zharkova on 23.11.2020.
//

import Foundation

class ContactsListInteractor : IContactsListInteractor {
    var data: Any?
    
    weak var contactsManager: ContactsManager?
    var output: IContactsListPresenter?
    
    private var contacts: [ContactInfo] = [ContactInfo]()
    
    init(contactsManager: ContactsManager?) {
        self.contactsManager = contactsManager
    }
    
    func fetchContacts() {
        self.contactsManager?.getAllContacts(success: { [weak self] (contacts) in
            guard let self = self else {return}
            self.contacts = [ContactInfo]()
            self.contacts.append(contentsOf: contacts)
            DispatchQueue.main.async {
                self.output?.setup(response: .success(data: self.contacts))
            }
        }, failure: { [weak self] (error) in
            guard let self = self else {return}
            self.output?.setup(response: .error(error: error))
        })
    }
    
    func selectContact(at index: Int) {
        self.data = self.contacts[index]
    }
}

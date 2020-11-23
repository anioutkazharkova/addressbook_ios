//
//  IContactsListInteractor.swift
//  addressbook
//
//  Created by Anna Zharkova on 23.11.2020.
//

import Foundation

protocol IContactsListInteractor :  IDataSource {
    var output: IContactsListPresenter? {get set}
    
    func fetchContacts()
    
    func selectContact(at index: Int)
}

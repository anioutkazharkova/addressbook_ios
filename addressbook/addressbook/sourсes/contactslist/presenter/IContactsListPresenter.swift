//
//  IContactsListPresenter.swift
//  addressbook
//
//  Created by Anna Zharkova on 23.11.2020.
//

import Foundation

protocol IContactsListPresenter : class {
    var output: IContactsListView? {get set}
    
    func setup(response: ContactsResponse)
}

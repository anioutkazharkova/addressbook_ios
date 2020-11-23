//
//  IContactsListView.swift
//  addressbook
//
//  Created by Anna Zharkova on 23.11.2020.
//

import Foundation

protocol IContactsListView : IView {
    var output: IContactsListInteractor? {get set}
    
    func setup(model: ContactsListViewModel)
    
    func showSettings()
}

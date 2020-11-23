//
//  IContactInfoPresenter.swift
//  addressbook
//
//  Created by Anna Zharkova on 24.11.2020.
//

import Foundation

protocol IContactInfoPresenter : class {
    var output: IContactInfoView? {get set}
    
    func setup(response: ContactItemResponse)
}

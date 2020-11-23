//
//  IContactInfoInteractor.swift
//  addressbook
//
//  Created by Anna Zharkova on 24.11.2020.
//

import Foundation

protocol IContactInfoInteractor : class {
    var output: IContactInfoPresenter? {get set}
    
    func loadContent()
}

//
//  IContactInfoView.swift
//  addressbook
//
//  Created by Anna Zharkova on 24.11.2020.
//

import Foundation

protocol IContactInfoView: IView {
    var output: IContactInfoInteractor? {get set}
    func setup(model: ContactInfoViewModel)
}

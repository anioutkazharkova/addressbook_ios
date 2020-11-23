//
//  IView.swift
//  addressbook
//
//  Created by Anna Zharkova on 23.11.2020.
//

import Foundation

protocol IView : class {
    var router: IRouter? {get set}
}

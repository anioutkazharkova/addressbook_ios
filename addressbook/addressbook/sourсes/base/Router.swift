//
//  Router.swift
//  addressbook
//
//  Created by Anna Zharkova on 23.11.2020.
//

import Foundation


protocol IDataSource : class {
    var data: Any? {get set}
}


enum Transition {
    case contact
    
    case back
}

protocol  IRouter : class {
    func performMove(transition: Transition, _ dataSource: IDataSource?)
}

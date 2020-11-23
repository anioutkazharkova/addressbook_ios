//
//  UITableView+Util.swift
//  addressbook
//
//  Created by Anna Zharkova on 23.11.2020.
//

import Foundation
import UIKit

extension UITableView {
    func nib(id: String) {
        self.register(UINib(nibName: id, bundle: nil),
                      forCellReuseIdentifier: id)
    }
}

extension UITableViewCell {

    static var cellId: String {
        return String(describing: self)
    }
}

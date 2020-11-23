//
//  UIViewController+message.swift
//  addressbook
//
//  Created by Anna Zharkova on 24.11.2020.
//

import Foundation
import UIKit

extension UIViewController {
    func showMessage(message: String, _ action: (() -> Void)? = nil) {
        if let alert = DialogHelper.createDialog(message: message, action) {
            self.present(alert, animated: true, completion: nil)
        }
    }
}

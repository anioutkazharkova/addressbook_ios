//
//  DialogHelper.swift
//  addressbook
//
//  Created by Anna Zharkova on 24.11.2020.
//

import Foundation
import UIKit

class DialogHelper: NSObject {
    class func createDialog(message: String? = "", _ okAction: (() -> Void)? = nil ) -> UIAlertController? {
        let  alert = UIAlertController.init(title: "", message: message, preferredStyle: .alert)
      
        alert.addAction(UIAlertAction.init(title: "OK", style: .default, handler: { (_: UIAlertAction) -> Void in
            okAction?()
        }))
        
        return alert
    }
    
}

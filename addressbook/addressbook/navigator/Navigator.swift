//
//  Navigator.swift
//  addressbook
//
//  Created by Anna Zharkova on 23.11.2020.
//

import Foundation
import UIKit

class Navigator {
    private init(){}
    
    static let shared = Navigator()
    
    weak var nc: UINavigationController? {
        get {
            return UIApplication.shared.top?.navigationController
        }
    }
    
    func open<T:UIViewController>(screen: T.Type, _ data: Any? = nil) {
        if let vc = ModuleConfig.shared.config(screen: screen)?
            .createScreen(data) {
            self.nc?.pushViewController(vc, animated: true)
        }
    }
    
    func setupRoot<T:UIViewController>(screen: T.Type) {
        if let vc = ModuleConfig.shared.config(screen: screen)?
            .createScreen(nil) {
            UIApplication.shared.setupRoot(viewController: UINavigationController(rootViewController: vc))
        }
    }
    
    func back() {
        if (self.nc?.viewControllers.count == 1) {
            self.finish()
        } else {
            self.nc?.popViewController(animated: true)
        }
    }
    
    func finish() {
        self.nc?.dismiss(animated: true, completion: nil)
    }
    
}


//
//  UIViewController+Util.swift
//  addressbook
//
//  Created by Anna Zharkova on 23.11.2020.
//

import Foundation
import UIKit

extension UIViewController {
    func top() -> UIViewController? {
        if let navigation = self as? UINavigationController {
            return navigation.visibleViewController?.top()
        }
        if let tab = self as? UITabBarController {
            if let selectedTab = tab.selectedViewController {
                return selectedTab.top()
            }
            return tab.top()
        }
        if let presented =  self.presentedViewController {
            return presented.top()
        }
        return self
    }
}

extension UIApplication {
    var top: UIViewController? {
        get {
            if #available(iOS 13.0, *) {
                if let scene = UIApplication.shared.connectedScenes.first,
                   let sceneDelegate  = scene as? UIWindowScene,
                   let rootVC = sceneDelegate.windows.first?.rootViewController {
                    return rootVC.top()
                }
            } else {
                return UIApplication.shared.keyWindow?.rootViewController?.top()
            }
            return nil
        }
    }
    
    
    func setupRoot(viewController: UIViewController) {
        if #available(iOS 13.0, *) {
            if let scene = UIApplication.shared.connectedScenes.first,
               let sceneDelegate  = scene as? UIWindowScene,
               let window = sceneDelegate.windows.first {
                window.rootViewController = viewController
                
            }
        }else {
            UIApplication.shared.keyWindow?.rootViewController = viewController
        }
    }
}

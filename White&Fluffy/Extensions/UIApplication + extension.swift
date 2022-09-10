//
//  UIApplication + extension.swift
//  White&Fluffy
//
//  Created by admin on 06.09.2022.
//

import Foundation
import UIKit

extension UIApplication {
    
    static func topViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
       
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return topViewController(base: selected)
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
        
    }
    
}

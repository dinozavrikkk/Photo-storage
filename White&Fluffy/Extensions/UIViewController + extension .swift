//
//  UIViewController + extension .swift
//  White&Fluffy
//
//  Created by admin on 05.09.2022.
//

import Foundation
import UIKit

extension UIViewController {
    
    func pushModule(withViewController viewController: UIViewController, animated: Bool = true, hidesTabBarWhenPushed: Bool = true) {
        viewController.hidesBottomBarWhenPushed = hidesTabBarWhenPushed
        navigationController?.pushViewController(viewController, animated: animated)
    }
    
}

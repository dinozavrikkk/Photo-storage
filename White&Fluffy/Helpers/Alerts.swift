//
//  Alerts.swift
//  White&Fluffy
//
//  Created by admin on 06.09.2022.
//

import Foundation
import UIKit

enum Alerts {
    
    static func getAlertLikedImageTapped(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        UIApplication.topViewController()?.present(alert, animated: true)
    }

}

//
//  AppDelegate.swift
//  White&Fluffy
//
//  Created by admin on 03.09.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if let url = RealmManager.shared.getDatabaseURL() {
            print("Database URL", url)
        }
        return true
    }

}


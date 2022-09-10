//
//  TabBarController.swift
//  White&Fluffy
//
//  Created by admin on 03.09.2022.
//

import Foundation
import UIKit

final class TabBarController: UITabBarController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        configureTabBar()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureTabBar() {
        
        tabBar.tintColor = .red
        tabBar.barTintColor = .gray
        tabBar.backgroundColor = .white
        
        tabBar.layer.borderColor = UIColor.gray.cgColor
        tabBar.layer.borderWidth = 1
        tabBar.layer.masksToBounds = true
        
        let searchController = ModuleBuilder.assemblySearchController()
        let likeController = ModuleBuilder.assemblyLikeController()
        
        let searchNavController = UINavigationController(rootViewController: searchController)
        let likeNavController = UINavigationController(rootViewController: likeController)
        
        searchNavController.tabBarItem = UITabBarItem(title: SupportFiles.Strings.TabBar.search,
                                                   image: SupportFiles.Images.TabBar.search,
                                                   tag: SupportFiles.Tabs.search.rawValue)
        likeNavController.tabBarItem = UITabBarItem(title: SupportFiles.Strings.TabBar.like,
                                                 image: SupportFiles.Images.TabBar.like,
                                                 tag: SupportFiles.Tabs.like.rawValue)
        
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = .white
        tabBar.standardAppearance = appearance
        setViewControllers([searchNavController, likeNavController], animated: false)
    }
    
}

//
//  SupportFiles.swift
//  White&Fluffy
//
//  Created by admin on 03.09.2022.
//

import Foundation
import UIKit

enum SupportFiles {
    
    enum Tabs: Int {
        case search
        case like
    }
    
    enum Strings {
        enum TabBar {
            static var search = "Search"
            static var like = "Like"
        }
    }

    enum Images {
        enum TabBar {
            static var search = UIImage(systemName: "magnifyingglass")
            static var like = UIImage(systemName: "heart")
        }
    }
    
}

//enum Localization {
//    enum TabBar {
//        case search
//        case like
//        
//        var title: String {
//            switch self {
//            case .like
//                return 
//            }
//        }
//    }
//}

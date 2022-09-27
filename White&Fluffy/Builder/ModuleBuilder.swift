//
//  ModuleBuilder.swift
//  White&Fluffy
//
//  Created by admin on 04.09.2022.
//

import Foundation
import UIKit

enum ModuleBuilder {
    
    static func assemblySearchController() -> UIViewController {
        let networkService = SearchNetworkService()
        let dataProvider = SearchDataProvider(networkService: networkService)
        let viewController = SearchViewController()
        let presenter = SearchPresenter(dataProvider: dataProvider, viewController: viewController)
        
        viewController.presenter = presenter
        return viewController
    }
    
    static func assemblyLikeController() -> UIViewController {
        let dataStorage = LikeDataStorage()
        let dataProvider = LikeDataProvider(dataStorage: dataStorage)
        let viewController = LikeViewController()
        let presenter = LikePresenter(dataProvider: dataProvider, viewController: viewController)
        
        viewController.presenter = presenter
        return viewController
    }
    
    static func assemblyInformationController(inputModel: InformationInputModel) -> UIViewController {
        let dataStorage = InformationDataStorage(model: model)
        let dataProvider = InformationDataProvider(dataStorage: dataStorage)
        let viewController = InformationViewController()
        let presenter = InformationPresenter(dataProvider: dataProvider, viewController: viewController)
        
        viewController.presenter = presenter
        return viewController
    }
    
}

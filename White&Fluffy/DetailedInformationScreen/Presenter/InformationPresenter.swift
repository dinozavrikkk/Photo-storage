//
//  InformationPresenter.swift
//  White&Fluffy
//
//  Created by admin on 05.09.2022.
//

import Foundation

final class InformationPresenter {
    
    private let dataProvider: InformationDataProviderProtocol
    private weak var viewController: InformationVCProtocol?
    
    init(dataProvider: InformationDataProviderProtocol, viewController: InformationVCProtocol?) {
        self.dataProvider = dataProvider
        self.viewController = viewController
    }
    
}

extension InformationPresenter: InformationPresenterProtocol {
    
    func savedInformation() {
        dataProvider.savingInformation()
    }
    
    func deletedInformation() {
        dataProvider.deletingInformation()
    }
    
    var getResultPhoto: Codable {
        dataProvider.transferingResultPhoto
    }
    
}

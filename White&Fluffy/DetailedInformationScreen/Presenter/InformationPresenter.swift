//
//  InformationPresenter.swift
//  White&Fluffy
//
//  Created by admin on 05.09.2022.
//

import Foundation

final class InformationPresenter {
    
    private let dataProvider: InformationDataProviderProtocol
    private let inputModel: InformationInputModel
    private weak var viewController: InformationVCProtocol?
    
    init(inputModel: InformationInputModel, dataProvider: InformationDataProviderProtocol, viewController: InformationVCProtocol?) {
        self.dataProvider = dataProvider
        self.viewController = viewController
    }
    
}

extension InformationPresenter: InformationPresenterProtocol {
    func viewDidLoad() {
        viewController?.setupView(viewModel: InformationViewModel(photo: inputModel., name: <#T##String#>, date: <#T##String#>, like: <#T##Int#>, description: <#T##String?#>))
    }
    
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

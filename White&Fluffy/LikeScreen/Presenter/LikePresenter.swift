//
//  LikePresenter.swift
//  White&Fluffy
//
//  Created by admin on 03.09.2022.
//

import Foundation

final class LikePresenter {
    
    private let dataProvider: LikeDataProviderProtocol
    private weak var viewController: LikeVCProtocol?
    
    init(dataProvider: LikeDataProviderProtocol, viewController: LikeVCProtocol?) {
        self.dataProvider = dataProvider
        self.viewController = viewController
    }
    
}

extension LikePresenter: LikePresenterProtocol {
    
    private func viewNeedUpdateCellsAfterUpdates() {
        dataProvider.transmittingLikeModelArray { _ in
            self.viewController?.fetchModel()
        }
    }
    
    func needUpdateCells() {
        viewNeedUpdateCellsAfterUpdates()
    }
    
    func likeModel(for indexPath: IndexPath) -> LikeModel {
        dataProvider.gettingLikeModelForCell(for: indexPath)
    }
    
    var modelsCount: Int {
        dataProvider.getTheNumberOfModels
    }
    
}

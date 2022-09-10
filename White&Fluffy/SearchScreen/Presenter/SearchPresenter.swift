//
//  SearchPresenter.swift
//  White&Fluffy
//
//  Created by admin on 03.09.2022.
//

import Foundation

final class SearchPresenter {
    
    private let dataProvider: DataProviderProtocol
    private weak var viewController: SearchVCProtocol?
    
    init(dataProvider: DataProviderProtocol, viewController: SearchVCProtocol?) {
        self.dataProvider = dataProvider
        self.viewController = viewController
    }
    
}

extension SearchPresenter: SearchPresenterProtocol {
    
    private func viewNeedUpdateDataAfterSearchBarClicked(text: String) {
        dataProvider.gettingDataAfterSearchBarClicked(text: text) { [weak self] _ in
            self?.viewController?.fetchModelAfterSearchBarClicked()
        }
    }
    
    private func dataTransmission(text: String) {
        dataProvider.gettingData(text: text) { [weak self] _ in
            self?.viewController?.fetchModel()
        }
    }
    
    func viewNeedUpdateData(text: String) {
        viewNeedUpdateDataAfterSearchBarClicked(text: text)
    }
    
    func viewIsReady(text: String) {
        dataTransmission(text: text)
    }
    
    func viewWillReachPhotoLimit(text: String) {
        dataTransmission(text: text)
    }
    
    var photoCount: Int {
        dataProvider.getTheNumberOfPhoto
    }
    
    func photo(for indexPath: IndexPath) -> ResultPhoto {
        dataProvider.gettingPhotoForCell(for: indexPath)
    }
    
}

//
//  SearchDataProvider.swift
//  White&Fluffy
//
//  Created by admin on 04.09.2022.
//

import Foundation

final class SearchDataProvider {
    
    private let dataStorage: DataStorageProtocol
    private let networkService: NetworkProtocol
    
    init(dataStorage: DataStorageProtocol = SearchDataStorage.shared,
         networkService: NetworkProtocol) {
        self.dataStorage = dataStorage
        self.networkService = networkService
    }
    
}

extension SearchDataProvider: DataProviderProtocol {
    
    func gettingDataAfterSearchBarClicked(text: String, completion: @escaping ([ResultPhoto]) -> Void) {
        networkService.workingWithNetworkAfterSearchBarClicked(text: text) { result in
            switch result {
            case .success(let model):
                completion(model)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func gettingData(text: String, completion: @escaping ([ResultPhoto]) -> Void) {
        networkService.workingWithNetwork(text: text) { result in
            switch result {
            case .success(let model):
                completion(model)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    var getTheNumberOfPhoto: Int {
        dataStorage.numberOfRowsInSection
    }
    
    func gettingPhotoForCell(for indexPath: IndexPath) -> ResultPhoto {
        dataStorage.getPhoto(for: indexPath)
    }
    
}

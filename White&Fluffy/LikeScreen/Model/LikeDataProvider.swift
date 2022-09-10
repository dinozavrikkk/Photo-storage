//
//  LikeDataProvider.swift
//  White&Fluffy
//
//  Created by admin on 07.09.2022.
//

import Foundation

final class LikeDataProvider {
    
    private let dataStorage: LikeDataStorageProtocol
    
    init(dataStorage: LikeDataStorageProtocol) {
        self.dataStorage = dataStorage
    }
    
}

extension LikeDataProvider: LikeDataProviderProtocol {
    
    func transmittingLikeModelArray(completion: @escaping ([LikeModel]) -> Void) {
        completion(dataStorage.fillLikeModelArray)
    }
    
    func gettingLikeModelForCell(for indexPath: IndexPath) -> LikeModel {
        dataStorage.getLikeModel(for: indexPath)
    }
    
    var getTheNumberOfModels: Int {
        dataStorage.numberOfRowsInSection
    }
    
}

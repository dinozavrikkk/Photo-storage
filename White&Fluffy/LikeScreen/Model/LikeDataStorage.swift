//
//  DataStorage.swift
//  White&Fluffy
//
//  Created by admin on 06.09.2022.
//

import Foundation
import RealmSwift

final class LikeDataStorage {
    
    private var likeModelArray: [LikeModel] = []
    
}

extension LikeDataStorage: LikeDataStorageProtocol {
    
    var fillLikeModelArray: [LikeModel] {
        likeModelArray = []
        likeModelArray += RealmManager.shared.getArrayLikeModels()
        return likeModelArray
    }
    
    func getLikeModel(for indexPath: IndexPath) -> LikeModel {
        return likeModelArray[indexPath.row]
    }
    
    var numberOfRowsInSection: Int {
        return likeModelArray.count
    }
    
}

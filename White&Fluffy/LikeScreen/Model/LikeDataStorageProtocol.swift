//
//  LikeDataStorageProtocol.swift
//  White&Fluffy
//
//  Created by admin on 07.09.2022.
//

import Foundation

protocol LikeDataStorageProtocol {
    
    var numberOfRowsInSection: Int { get }
    func getLikeModel(for indexPath: IndexPath) -> LikeModel
    var fillLikeModelArray: [LikeModel] { get }
    
}

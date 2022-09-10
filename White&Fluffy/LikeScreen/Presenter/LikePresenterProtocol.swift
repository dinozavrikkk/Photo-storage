//
//  LikePresenterProtocol.swift
//  White&Fluffy
//
//  Created by admin on 06.09.2022.
//

import Foundation

protocol LikePresenterProtocol {
    
    var modelsCount: Int { get }
    func likeModel(for indexPath: IndexPath) -> LikeModel
    func needUpdateCells()
    
}

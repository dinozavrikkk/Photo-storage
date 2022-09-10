//
//  LikeDataProviderProtocol.swift
//  White&Fluffy
//
//  Created by admin on 07.09.2022.
//

import Foundation

protocol LikeDataProviderProtocol {
    
    var getTheNumberOfModels: Int { get }
    func gettingLikeModelForCell(for indexPath: IndexPath) -> LikeModel
    func transmittingLikeModelArray(completion: @escaping ([LikeModel]) -> Void)
    
}

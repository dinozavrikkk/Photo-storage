//
//  InformationDataStorage.swift
//  White&Fluffy
//
//  Created by admin on 06.09.2022.
//

import Foundation
import RealmSwift

final class InformationDataStorage {
    
    private let model: Codable
//    private var likeModelArray: Results<LikeModel>!
    
    init(model: Codable) {
        self.model = model
    }
    
}

extension InformationDataStorage: InformationDataStorageProtocol {
    
    var transferResultPhoto: Codable {
        return model
    }
    
    func saveInformation() {
        if let model = model as? ResultPhoto {
            guard let id = model.id,
                  let authorName = model.user?.name,
                  let smallImageURL = model.urls?.small,
                  let regularImageURL = model.urls?.regular,
                  let date = model.created_at,
                  let likes = model.likes
            else { return }
            let value = LikeModel(id: id,
                                  authorName: authorName,
                                  smallImageURL: smallImageURL,
                                  regularImageURL: regularImageURL,
                                  date: date,
                                  descript: model.description ?? "The author of this photo did not write a description",
                                  likes: likes)
            RealmManager.shared.saveLikeModel(likeModel: value)
        } else {
            if let model = model as? LikeModel {
                RealmManager.shared.saveLikeModel(likeModel: model)
            }
        }
    }
    
    func deleteInformation() {
//        likeModelArray = RealmManager.shared.getAllModels()
//        if let model = model as? ResultPhoto {
//            guard let id = model.id,
//                  let authorName = model.user?.name,
//                  let smallImageURL = model.urls?.small,
//                  let regularImageURL = model.urls?.regular,
//                  let date = model.created_at,
//                  let likes = model.likes
//            else { return }
//            let value = LikeModel(id: id,
//                                  authorName: authorName,
//                                  smallImageURL: smallImageURL,
//                                  regularImageURL: regularImageURL,
//                                  date: date,
//                                  descript: model.description ?? "The author of this photo did not write a description",
//                                  likes: likes)
//            RealmManager.shared.deleteLikeModel(model: value)
//        }
    }
    
}

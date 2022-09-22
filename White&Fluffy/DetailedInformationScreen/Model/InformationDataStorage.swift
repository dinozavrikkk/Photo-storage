//
//  InformationDataStorage.swift
//  White&Fluffy
//
//  Created by admin on 06.09.2022.
//

import Foundation

final class InformationDataStorage {
    
    private let model: Codable
    private var temporaryStorageArray: [TemporaryStorage] = []
    
    init(model: Codable) {
        self.model = model
    }
    
}

extension InformationDataStorage: InformationDataStorageProtocol {
    
    var transferResultPhoto: Codable {
        if let model = model as? LikeModel {
            let value = TemporaryStorage(id: model.id,
                                         authorName: model.authorName,
                                         smallImageURL: model.smallImageURL,
                                         regularImageURL: model.regularImageURL,
                                         date: model.date,
                                         descript: model.descript,
                                         likes: model.likes)
            temporaryStorageArray.append(value)
        }
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
            if let _ = model as? LikeModel {
                guard let arrayElement = temporaryStorageArray.first else { return }
                let value = LikeModel(id: arrayElement.id,
                                      authorName: arrayElement.authorName,
                                      smallImageURL: arrayElement.smallImageURL,
                                      regularImageURL: arrayElement.regularImageURL,
                                      date: arrayElement.date,
                                      descript: arrayElement.descript,
                                      likes: arrayElement.likes)
                RealmManager.shared.saveLikeModel(likeModel: value)
            }
        }
    }
    
    func deleteInformation() {
        if let model = model as? ResultPhoto {
            guard let id = model.id else { return }
            RealmManager.shared.deleteFirstLikeModel(id: id)
        } else {
            if let model = model as? LikeModel {
                RealmManager.shared.deleteFirstLikeModel(id: model.id)
            }
        }
    }
    
}



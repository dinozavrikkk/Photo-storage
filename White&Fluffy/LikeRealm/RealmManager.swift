//
//  RealmManager.swift
//  White&Fluffy
//
//  Created by admin on 06.09.2022.
//

import Foundation
import RealmSwift

class RealmManager {
    
    static let shared = RealmManager()
    
    private init() {}
    
    private let realm = try! Realm()
    
    func getDatabaseURL() -> URL? {
        return Realm.Configuration.defaultConfiguration.fileURL
    }
    
    func saveLikeModel(likeModel: LikeModel) {
        try? realm.write {
            realm.add(likeModel)
        }
    }
    
    func deleteLikeModel(model: LikeModel) {
        try? realm.write {
            realm.delete(model)
        }
    }
    
    func deleteFirstLikeModel(id: String) {
        try? realm.write {
            let object = realm.objects(LikeModel.self).filter { $0.id == id }.first
            realm.delete(object!)
        }
    }
    
    func getArrayLikeModels() -> [LikeModel] {
        return Array(realm.objects(LikeModel.self))
    }
    
    func getAllModels() -> Results<LikeModel> {
        return realm.objects(LikeModel.self)
    }
    
}

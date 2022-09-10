//
//  LikeModel.swift
//  White&Fluffy
//
//  Created by admin on 06.09.2022.
//

import Foundation
import RealmSwift

class LikeModel: Object, Codable {
    
    @Persisted var id: String
    @Persisted var authorName: String
    @Persisted var smallImageURL: String
    @Persisted var regularImageURL: String
    @Persisted var date: String
    @Persisted var descript: String
    @Persisted var likes: Int
    
    convenience init(id: String, authorName: String, smallImageURL: String, regularImageURL: String, date: String, descript: String, likes: Int) {
        self.init()
        self.id = id
        self.authorName = authorName
        self.smallImageURL = smallImageURL
        self.regularImageURL = regularImageURL
        self.date = date
        self.descript = descript
        self.likes = likes
    }
}

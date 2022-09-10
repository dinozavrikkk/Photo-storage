//
//  PhotoModel.swift
//  White&Fluffy
//
//  Created by admin on 04.09.2022.
//

import Foundation
import RealmSwift

struct Photos: Codable {
    let total: Int?
    let totalPages: Int?
    let results: [ResultPhoto]?
}

struct ResultPhoto: Codable {
    let id: String?
    let urls: Urls?
    let user: Users?
    let created_at: String?
    let description: String?
    let likes: Int?
}

struct Urls: Codable {
    let raw: String?
    let full: String?
    let regular: String?
    let small: String?
}

struct Users: Codable {
    let name: String?
}

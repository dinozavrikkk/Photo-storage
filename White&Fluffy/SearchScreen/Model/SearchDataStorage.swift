//
//  SearchDataStorage.swift
//  White&Fluffy
//
//  Created by admin on 04.09.2022.
//

import Foundation

final class SearchDataStorage {
    
    private var results: [ResultPhoto] = []
    
    static let shared = SearchDataStorage()
    
    private init() { }
    
}

extension SearchDataStorage: DataStorageProtocol {
    
    func fillingPhotoWithDataAfterSearchBarClicked(data: Photos) {
        guard let photos = data.results else { return }
        results = []
        return results += photos
    }
   
    func fillingPhotoWithData(data: Photos) {
        guard let photos = data.results else { return }
        return results += photos
    }
    
    var transmittingPhotoArray: [ResultPhoto] {
        return results
    }
    
    var numberOfRowsInSection: Int {
        return results.count
    }
    
    func getPhoto(for indexPath: IndexPath) -> ResultPhoto {
        return results[indexPath.row]
    }
    
}

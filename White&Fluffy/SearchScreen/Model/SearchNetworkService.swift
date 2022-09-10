//
//  SearchNetworkService.swift
//  White&Fluffy
//
//  Created by admin on 04.09.2022.
//

import Foundation

final class SearchNetworkService {
    
    private var currentPage = 1
    private let dataStorage: DataStorageProtocol
    
    init(dataStorage: DataStorageProtocol = SearchDataStorage.shared) {
        self.dataStorage = dataStorage
    }
    
}

extension SearchNetworkService: NetworkProtocol {
    
    func workingWithNetworkAfterSearchBarClicked(text: String, completion: @escaping (Result<[ResultPhoto], Error>) -> Void) {
        self.currentPage = 1
        guard let url = URL(string: "https://api.unsplash.com/search/photos?page=\(self.currentPage)&query=\(text)&client_id=CRdZEbxYAIYG4F_h10KrKcRMw8LQ5CvTHqh9IB2v9oc")
        else { return }
        
        self.currentPage += 1
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            if let data = data,
               let photo = try? JSONDecoder().decode(Photos.self, from: data) {
                DispatchQueue.main.async {
                    self.dataStorage.fillingPhotoWithDataAfterSearchBarClicked(data: photo)
                    completion(.success(self.dataStorage.transmittingPhotoArray))
                }
            }
            else {
                guard let error = error else { return }
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
    
    func workingWithNetwork(text: String, completion: @escaping (Result<[ResultPhoto], Error>) -> Void) {
        guard let url = URL(string: "https://api.unsplash.com/search/photos?page=\(self.currentPage)&query=\(text)&client_id=CRdZEbxYAIYG4F_h10KrKcRMw8LQ5CvTHqh9IB2v9oc")
        else { return }
        
        self.currentPage += 1
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            if let data = data,
               let photo = try? JSONDecoder().decode(Photos.self, from: data) {
                DispatchQueue.main.async {
                    self.dataStorage.fillingPhotoWithData(data: photo)
                    completion(.success(self.dataStorage.transmittingPhotoArray))
                }
            } else {
                self.currentPage -= 1
                guard let error = error else { return }
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
}



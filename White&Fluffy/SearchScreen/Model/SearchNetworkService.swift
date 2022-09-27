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
    private let networkDataFetcher: NetworkDataFetcher
    
    init(dataStorage: DataStorageProtocol = SearchDataStorage.shared) {
        self.dataStorage = dataStorage
    }
    
}

extension SearchNetworkService: NetworkProtocol {

    func workingWithNetworkAfterSearchBarClicked(text: String, completion: @escaping [ResultPhoto]) -> Void) {
        networkDataFetcher.fetchJSONData(urlString: text, completion: completion)
        
        
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



class NetworkService {
    func request(urlString: String, completion: @escaping (Data?, Error?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        let task = createDataTask(from: request, completion: completion)
        task.resume()
    }
    
    private func createDataTask(from request: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
    }
}

class DataDecoder {
    func decodeJSON<T: Codable>(type: T.Type, data: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = data else { return nil }
        do {
            let objects = try decoder.decode(type, from: data)
            return objects
        } catch { }
        
        return nil
    }
}

class NetworkDataFetcher {
    var networkService = NetworkService()
    var dataDecoder = DataDecoder()
    
    func fetchJSONData<T: Codable>(urlString: String, completion: @escaping (T?) -> Void) {
        networkService.request(urlString: urlString) { data, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }
            
            let decoded = self.dataDecoder.decodeJSON(type: T.self, data: data)
            completion(decoded)
        }
    }
}

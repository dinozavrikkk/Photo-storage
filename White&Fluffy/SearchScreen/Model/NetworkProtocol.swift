//
//  NetworkProtocol.swift
//  White&Fluffy
//
//  Created by admin on 04.09.2022.
//

import Foundation

protocol NetworkProtocol {
    func workingWithNetwork(text: String, completion: @escaping (Result<[ResultPhoto], Error>) -> Void)
    func workingWithNetworkAfterSearchBarClicked(text: String, completion: @escaping (Result<[ResultPhoto], Error>) -> Void)
}

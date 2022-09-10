//
//  InformationDataStorageProtocol.swift
//  White&Fluffy
//
//  Created by admin on 06.09.2022.
//

import Foundation

protocol InformationDataStorageProtocol {
    
    var transferResultPhoto: Codable { get }
    func saveInformation()
    func deleteInformation()
    
}

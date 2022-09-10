//
//  InformationDataProvider.swift
//  White&Fluffy
//
//  Created by admin on 06.09.2022.
//

import Foundation

final class InformationDataProvider {
    
    private let dataStorage: InformationDataStorageProtocol
    
    init(dataStorage: InformationDataStorageProtocol) {
        self.dataStorage = dataStorage
    }
    
}

extension InformationDataProvider: InformationDataProviderProtocol {
    
    func savingInformation() {
        dataStorage.saveInformation()
    }
    
    func deletingInformation() {
        dataStorage.deleteInformation()
    }
    
    var transferingResultPhoto: Codable {
        dataStorage.transferResultPhoto
    }
    
}

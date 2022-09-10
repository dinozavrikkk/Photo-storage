//
//  InformationDataProviderProtocol.swift
//  White&Fluffy
//
//  Created by admin on 06.09.2022.
//

import Foundation

protocol InformationDataProviderProtocol {
    
    var transferingResultPhoto: Codable { get }
    func savingInformation()
    func deletingInformation()
    
}

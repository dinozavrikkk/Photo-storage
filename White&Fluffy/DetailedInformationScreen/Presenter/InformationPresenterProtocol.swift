//
//  PresenterInformationProtocol.swift
//  White&Fluffy
//
//  Created by admin on 05.09.2022.
//

import Foundation

protocol InformationPresenterProtocol: AnyObject {
    
    var getResultPhoto: Codable { get }
    func savedInformation()
    func deletedInformation()
    
}

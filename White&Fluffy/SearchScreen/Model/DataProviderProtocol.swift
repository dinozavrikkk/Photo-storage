//
//  DataProviderProtocol.swift
//  White&Fluffy
//
//  Created by admin on 04.09.2022.
//

import Foundation

protocol DataProviderProtocol {
    func gettingDataAfterSearchBarClicked(text: String, completion: @escaping ([ResultPhoto]) -> Void)
    func gettingData(text: String, completion: @escaping ([ResultPhoto]) -> Void)
    var getTheNumberOfPhoto: Int { get }
    func gettingPhotoForCell(for indexPath: IndexPath) -> ResultPhoto
}

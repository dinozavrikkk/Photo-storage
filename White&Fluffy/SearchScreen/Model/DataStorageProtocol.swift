//
//  DataStorageProtocol.swift
//  White&Fluffy
//
//  Created by admin on 04.09.2022.
//

import Foundation

protocol DataStorageProtocol {
    func fillingPhotoWithDataAfterSearchBarClicked(data: Photos)
    func fillingPhotoWithData(data: Photos)
    var transmittingPhotoArray: [ResultPhoto] { get }
    var numberOfRowsInSection: Int { get }
    func getPhoto(for indexPath: IndexPath) -> ResultPhoto
}

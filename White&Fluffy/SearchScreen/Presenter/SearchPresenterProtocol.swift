//
//  PresenterProtocol.swift
//  White&Fluffy
//
//  Created by admin on 04.09.2022.
//

import Foundation

protocol SearchPresenterProtocol: AnyObject {
    var photoCount: Int { get }
    
    func viewNeedUpdateData(text: String)
    func viewIsReady(text: String)
    func viewWillReachPhotoLimit(text: String)
    func photo(for indexPath: IndexPath) -> ResultPhoto
}

//
//  MockWebservice.swift
//  PhotosTests
//
//  Created by Dzmitry Makarevich on 10/14/21.
//

import Foundation
@testable import Photos

class MockWebservice: WebserviceType {
    var isError: Bool = false
    var photos = [
        Photo(id: 1, albumId: 1, title: "Title", url: "someUrl", thumbnailUrl: "thumbnailUrl"),
        Photo(id: 2, albumId: 2, title: "Title", url: "someUrl", thumbnailUrl: "thumbnailUrl"),
        Photo(id: 3, albumId: 1, title: "Title", url: "someUrl", thumbnailUrl: "thumbnailUrl")
    ]
    
    func request<T>(_ endPoint: UrlEndPoint,
                    successHandler: @escaping (T) -> Void,
                    errorHandler: @escaping (() -> Void)) where T : Decodable {
        if isError {
            errorHandler()
        } else {
            
            switch endPoint {
            case .allPhotos:
                successHandler(photos as! T)
            case .detailPhoto(_):
                successHandler(photos[0] as! T)
            }
        }
        
    }
    

}

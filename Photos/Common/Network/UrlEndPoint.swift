//
//  UrlEndPoint.swift
//  Photos
//
//  Created by Dzmitry Makarevich on 10/13/21.
//

import Foundation

enum UrlEndPoint {
    case allPhotos
    case detailPhoto(Int)

    var url: URL? {
        switch self {
        case .allPhotos:
            return URL(string: "https://jsonplaceholder.typicode.com/photos")
        case .detailPhoto(let id):
            return URL(string: "https://jsonplaceholder.typicode.com/photos/\(id)")
        }
    }
}

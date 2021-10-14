//
//  Photo.swift
//  Photos
//
//  Created by Dzmitry Makarevich on 10/13/21.
//

import Foundation

struct Photo: Codable {
    var id: Int
    var albumId: Int
    var title: String
    var url: String
    var thumbnailUrl: String
}

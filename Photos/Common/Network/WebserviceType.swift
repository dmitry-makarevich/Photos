//
//  WebserviceType.swift
//  Photos
//
//  Created by Dzmitry Makarevich on 10/13/21.
//

import Foundation

protocol WebserviceType {
    func request<T: Decodable>(_ endPoint: UrlEndPoint,
                               successHandler: @escaping (T) -> Void,
                               errorHandler: @escaping (() -> Void))
}

//
//  Webservice.swift
//  Photos
//
//  Created by Dzmitry Makarevich on 10/13/21.
//

import Foundation

typealias SuccessHandler<T: Decodable> = (T) -> Void
typealias ErrorHandler = () -> Void

class Webservice: WebserviceType {
    
    func request<T: Decodable>(_ endPoint: UrlEndPoint = .allPhotos,
                              successHandler: @escaping (T) -> Void,
                              errorHandler: @escaping (() -> Void)) {
        guard let url = endPoint.url else { return }
        
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession
            .shared
            .dataTask(with: request) { data, response, error in
                guard error == nil,
                      let data = data else {
                    errorHandler()
                    return
                }

                do {
                    let items = try JSONDecoder().decode(T.self, from: data)
                    successHandler(items)
                } catch {
                    errorHandler()
                    print("JSON error: \(error.localizedDescription)")
                }
                
            }
        
        task.resume()
    }
}

//
//  Ex+UIImageView.swift
//  Photos
//
//  Created by Dzmitry Makarevich on 10/13/21.
//

import UIKit

extension UIImageView {
    
    func downloadImage(with string: String,
                       completion: @escaping () -> Void) {
        guard let url = URL(string: string) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let data = data {
                    self.image = UIImage(data: data)
                }
                completion()
            }
        }
        .resume()
    }
}

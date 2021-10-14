//
//  DetailViewModel.swift
//  Photos
//
//  Created by Dzmitry Makarevich on 10/13/21.
//

import Foundation

class DetailViewModel {
    private let coordinator: MainCoordinator
    private let webservice: WebserviceType
    private let photoId: Int
    private var photo: Photo?
    
    init(photoId: Int, coordinator: MainCoordinator, webservice: WebserviceType) {
        self.photoId = photoId
        self.coordinator = coordinator
        self.webservice = webservice
    }

    func loadPhoto(completionHandler: @escaping (Photo?) -> Void) {
        let success: SuccessHandler = { [weak self] (receivePhoto: Photo) in
            DispatchQueue.main.async {
                self?.photo = receivePhoto
                completionHandler(receivePhoto)
            }
        }

        let errors: ErrorHandler = { [weak self] in
            DispatchQueue.main.async {
                self?.coordinator.showErrorAlert()
                completionHandler(nil)
            }
        }

        webservice.request(.detailPhoto(photoId), successHandler: success, errorHandler: errors)
    }
}

//
//  MainViewModel.swift
//  Photos
//
//  Created by Dzmitry Makarevich on 10/13/21.
//

import UIKit

class MainViewModel {
    private let coordinator: MainCoordinator
    private let webservice: WebserviceType
    private var photos = [Photo]()

    init(coordinator: MainCoordinator, webservice: WebserviceType) {
        self.coordinator = coordinator
        self.webservice = webservice
    }

    func loadPhotos(completionHandler: @escaping ([Photo]) -> Void) {
        
        let success: SuccessHandler = { [weak self] (receivePhotos: [Photo]) in
            DispatchQueue.main.async {
                self?.photos = receivePhotos
                completionHandler(receivePhotos)
            }
        }

        let errors: ErrorHandler = { [weak self] in
            DispatchQueue.main.async {
                self?.coordinator.showErrorAlert()
                completionHandler([])
            }
        }

        webservice.request(.allPhotos, successHandler: success, errorHandler: errors)
    }

    func selectedPhoto(_ photo: Photo) {
        coordinator.showDetails(for: photo.id)
    }
}

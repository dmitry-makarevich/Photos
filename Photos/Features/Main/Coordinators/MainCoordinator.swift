//
//  MainCoordinator.swift
//  Photos
//
//  Created by Dzmitry Makarevich on 10/13/21.
//

import UIKit

class MainCoordinator {
    private(set) var navigationController = UINavigationController()
    private var webservice: WebserviceType = Webservice()

    func start() -> UIViewController {
        let viewModel = MainViewModel(coordinator: self, webservice: webservice)
        let vc = MainViewController.newInstant(viewModel: viewModel)
        
        navigationController.pushViewController(vc, animated: true)
        
        return navigationController
    }

    func showDetails(for id: Int) {
        let detailViewModel = DetailViewModel(photoId: id,
                                              coordinator: self,
                                              webservice: webservice)
        let vc = DetailViewController.newInstant(viewModel: detailViewModel)
        
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showErrorAlert() {
        let alert = UIAlertController(title: "Loading Error",
                                      message: "Error while loading data. Please try again later.",
                                      preferredStyle: .alert)

        let cancelAction = UIAlertAction(title: "OK",
                                         style: .cancel)

        alert.addAction(cancelAction)

        self.navigationController.present(alert, animated: true)
    }
}

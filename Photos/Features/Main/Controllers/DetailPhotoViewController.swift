//
//  DetailViewController.swift
//  Photos
//
//  Created by Admin on 14.10.2021.
//

import UIKit

class DetailViewController: UIViewController {
    private var viewModel: DetailPhotoViewModel?

    static func newInstant(viewModel: DetailPhotoViewModel) -> DetailViewController {
        let vc = DetailViewController.instantiate()
        vc.viewModel = viewModel
        
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // MARK: - Navigation

}

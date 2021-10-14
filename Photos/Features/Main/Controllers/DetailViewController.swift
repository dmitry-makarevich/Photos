//
//  DetailViewController.swift
//  Photos
//
//  Created by Dzmitry Makarevich on 10/13/21.
//

import UIKit

class DetailViewController: UIViewController {
    private var viewModel: DetailViewModel?
    
    @IBOutlet private weak var fullImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var albumLabel: UILabel!
    @IBOutlet private weak var imageLoadingIndicator: UIActivityIndicatorView!
    
    static func newInstant(viewModel: DetailViewModel) -> DetailViewController {
        let vc = DetailViewController.instantiate()
        vc.viewModel = viewModel
        
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel?.loadPhoto() { [weak self] receivePhoto in
            guard let photo = receivePhoto else { return }
                       
            self?.set(with: photo)
        }
    }
    
    private func set(with photo: Photo) {
        fullImageView.downloadImage(with: photo.url) { [weak self] in
            self?.imageLoadingIndicator.stopAnimating()
        }
        titleLabel.text = photo.title
        albumLabel.text = "Album № \(photo.albumId)"
    }    
}

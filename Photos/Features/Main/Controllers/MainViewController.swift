//
//  MainViewController.swift
//  Photos
//
//  Created by Dzmitry Makarevich on 10/13/21.
//

import UIKit

class MainViewController: UIViewController {
    // MARK: - Variables
    private var viewModel: MainViewModel?
    private var photos: [Photo] = []
    
    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var emptyLabel: UILabel!
    @IBOutlet private weak var loadingIndicator: UIActivityIndicatorView!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        initializeTableView()
    }
    
    // MARK: - New instance creating
    static func newInstant(viewModel: MainViewModel) -> MainViewController {
        let vc = MainViewController.instantiate()
        vc.viewModel = viewModel
        
        return vc
    }

    // MARK: - Setup & Config
    private func initializeTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(cell: PhotoTableViewCell.self)
    }

    private func setup() {
        title = "Photos"
        emptyLabel.text = "List is empty"
        emptyLabel.isHidden = true
        
        loadingIndicator.startAnimating()
    
        viewModel?.loadPhotos() { [weak self] receivePhotos in
            self?.loadingIndicator.stopAnimating()
            self?.photos = receivePhotos
            self?.emptyLabel.isHidden = !receivePhotos.isEmpty
            
            self?.tableView.reloadData()
        }
    }

}

// MARK: - UITableViewDelegate & UITableViewDataSource implementation
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PhotoTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        
        cell.set(with: photos[indexPath.row])

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let photo = photos[indexPath.row]
        viewModel?.selectedPhoto(photo)
    }
}

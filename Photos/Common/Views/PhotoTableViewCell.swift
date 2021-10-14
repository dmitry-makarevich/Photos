//
//  PhotoTableViewCell.swift
//  Photos
//
//  Created by Dzmitry Makarevich on 10/13/21.
//

import UIKit

typealias CompletionHandler = () -> Void

class PhotoTableViewCell: UITableViewCell {
    @IBOutlet private weak var previewImageView: UIImageView!
    @IBOutlet private weak var title: UILabel!
    @IBOutlet private weak var loadingIndicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        loadingIndicator.hidesWhenStopped = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()

        previewImageView.image = nil
        title.text = nil
        loadingIndicator.startAnimating()
    }
    
    func set(with photo: Photo) {
        let completion: CompletionHandler = { [weak self] in
            self?.loadingIndicator.stopAnimating()
        }
        
        title.text = photo.title
        previewImageView.downloadImage(with: photo.thumbnailUrl,
                                       completion: completion)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}

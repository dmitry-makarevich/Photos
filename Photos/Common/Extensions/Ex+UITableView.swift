//
//  Ex+UITableView.swift
//  Photos
//
//  Created by Dzmitry Makarevich on 10/13/21.
//

import UIKit

extension UITableView {
    
    func register(cell: UITableViewCell.Type) {
        register(UINib(nibName: cell.className, bundle: nil),
                 forCellReuseIdentifier: cell.className)
    }
    
    func register(cellClass: UITableViewCell.Type) {
        register(cellClass, forCellReuseIdentifier: cellClass.className)
    }

    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.className,
                                            for: indexPath) as? T else {
            return T()
        }

        return cell
    }
}

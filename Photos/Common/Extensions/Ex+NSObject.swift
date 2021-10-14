//
//  Ex+NSObject.swift
//  Photos
//
//  Created by Dzmitry Makarevich on 10/13/21.
//

import Foundation

extension NSObject {
    var className: String {
        String(describing: type(of: self))
    }

    class var className: String {
        String(describing: self)
    }
}

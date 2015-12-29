//
//  Category.swift
//  alphabet-fitness
//
//  Created by Kath Faulkner on 27/12/2015.
//  Copyright © 2015 T3D. All rights reserved.
//

import Foundation
import UIKit

class Category {
    
    var _id: String!
    var _name: String!
    var _image: UIImage!
    
    var id: String { return _id }
    var name: String { return _name }
    var image: UIImage { return _image }
    
    init(id: String, name: String, image: UIImage) {
        self._id = id
        self._name = name
        self._image = image
    }
}
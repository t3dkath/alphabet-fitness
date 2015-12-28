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
    
    var _name: String!
    var _image: String!
    
    var name: String { return _name }
    var image: String { return _image }
    
    init(name: String, image: String) {
        self._name = name
        self._image = image
    }
}
//
//  Exercise.swift
//  alphabet-fitness
//
//  Created by Kath Faulkner on 27/12/2015.
//  Copyright © 2015 T3D. All rights reserved.
//

import Foundation

class Exercise {
    
    private var _identifier: String!
    private var _name: String!
    private var _image: String!
    private var _description: String!
    private var _category: Category!
    
    var identifier: String { return _identifier }
    var name: String { return _name }
    var image: String { return _image }
    var description: String { return _description }
    var category: Category { return _category }
    
    init(identifier: String, name: String, image: String, description: String, category: Category) {
        self._identifier = identifier
        self._name = name
        self._image = image
        self._description = description
        self._category = category
    }
    
}
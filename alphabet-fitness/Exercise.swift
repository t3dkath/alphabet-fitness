//
//  Exercise.swift
//  alphabet-fitness
//
//  Created by Kath Faulkner on 27/12/2015.
//  Copyright © 2015 T3D. All rights reserved.
//

import Foundation
import UIKit

class Exercise: NSObject, NSCoding {
    
    private var _identifier: String!
    private var _name: String!
    private var _image: UIImage!
    private var _description: String!
    private var _category: Category!
    
    var identifier: String { return _identifier }
    var name: String { return _name }
    var image: UIImage { return _image }
    var desc: String { return _description }
    var category: Category { return _category }
    
    init(identifier: String, name: String, image: UIImage, description: String, category: Category) {
        self._identifier = identifier
        self._name = name
        self._image = image
        self._description = description
        self._category = category
    }
    
    required init(coder aDecoder: NSCoder) {
        self._identifier = aDecoder.decodeObjectForKey("identifier") as? String ?? ""
        self._name = aDecoder.decodeObjectForKey("name") as? String ?? ""
        self._image = aDecoder.decodeObjectForKey("image") as? UIImage
        self._description = aDecoder.decodeObjectForKey("desc") as? String ?? ""
        self._category = aDecoder.decodeObjectForKey("category") as? Category
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(identifier, forKey: "identifier")
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeObject(image, forKey: "image")
        aCoder.encodeObject(desc, forKey: "desc")
        aCoder.encodeObject(category, forKey: "category")
    }
    
}
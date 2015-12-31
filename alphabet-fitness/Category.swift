//
//  Category.swift
//  alphabet-fitness
//
//  Created by Kath Faulkner on 27/12/2015.
//  Copyright © 2015 T3D. All rights reserved.
//

import Foundation
import UIKit

class Category: NSObject, NSCoding {
    
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
    
    required init(coder aDecoder: NSCoder) {
        self._id = aDecoder.decodeObjectForKey("id") as? String ?? ""
        self._name = aDecoder.decodeObjectForKey("name") as? String ?? ""
        self._image = aDecoder.decodeObjectForKey("image") as? UIImage
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(id, forKey: "id")
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeObject(image, forKey: "image")
    }
}
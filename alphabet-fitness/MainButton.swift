//
//  MainButton.swift
//  alphabet-fitness
//
//  Created by Kath Faulkner on 29/12/2015.
//  Copyright © 2015 T3D. All rights reserved.
//

import UIKit

class MainButton: Button {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = UIColor(red: 70/255, green: 208/255, blue: 155/255, alpha: 1.0)
        setTitleColor(UIColor.whiteColor(), forState: .Normal)
    }

}

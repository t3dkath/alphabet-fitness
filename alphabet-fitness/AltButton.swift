//
//  AltButton.swift
//  alphabet-fitness
//
//  Created by Kath Faulkner on 29/12/2015.
//  Copyright © 2015 T3D. All rights reserved.
//

import UIKit

class AltButton: Button {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = UIColor(red: 29/255, green: 29/255, blue: 38/255, alpha: 0.1)
        setTitleColor(UIColor(red: 29/255, green: 29/255, blue: 38/255, alpha: 0.5), forState: .Normal)
    }

}

//
//  UglyCell.swift
//  marks-table-view
//
//  Created by Kath Faulkner on 23/12/2015.
//  Copyright © 2015 T3D. All rights reserved.
//

import UIKit

class UglyCell: UITableViewCell {

    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var mainLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        mainImage.layer.cornerRadius = 5.0
        mainImage.clipsToBounds = true
    }
    
    func configureCell(image:UIImage, text:String) {
        mainImage.image = image
        mainLabel.text = text
    }

}

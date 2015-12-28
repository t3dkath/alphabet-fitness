//
//  ExerciseCell.swift
//  alphabet-fitness
//
//  Created by Kath Faulkner on 28/12/2015.
//  Copyright © 2015 T3D. All rights reserved.
//

import UIKit

class ExerciseCell: UITableViewCell {

    @IBOutlet weak var exTitle: UILabel!
    @IBOutlet weak var catTitle: UILabel!
    @IBOutlet weak var catImage: UIImageView!
    @IBOutlet weak var letter: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(exercise:Exercise) {
        exTitle.text = exercise.name
        catTitle.text = exercise.category.name
        catImage.image = exercise.category.image
        letter.text = exercise.identifier
    }

}

//
//  ViewController.swift
//  alphabet-fitness
//
//  Created by Kath Faulkner on 27/12/2015.
//  Copyright © 2015 T3D. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var wordInput: UITextField!
    @IBOutlet weak var wotdTitleLbl: UILabel!
    @IBOutlet weak var wotdTimeLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBarHidden = true
        
        wotdTitleLbl.text = ExerciseManager.instance.wordOfTheDay.uppercaseString
        wotdTimeLbl.text = ExerciseManager.instance.getWorkoutTime(ExerciseManager.instance.wordOfTheDay)
    }
    
    @IBAction func showAllExercises() {
        performSegueWithIdentifier("AlphaSegue", sender: self)
    }
    
    @IBAction func showWordExercises() {
        if let word = wordInput.text where word != "" {
            ExerciseManager.instance.setWorkoutForWord(word)
            performSegueWithIdentifier("WordSegue", sender: self)
        } else {
            print("no word")
        }
    }

    @IBAction func showWOTDExercises(sender: AnyObject) {
        ExerciseManager.instance.setWorkoutForWord("Feel the burn")
        performSegueWithIdentifier("WordSegue", sender: self)
    }

}


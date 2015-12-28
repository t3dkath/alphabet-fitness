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
        
        wotdTitleLbl.text = ExerciseManager.instance.wordOfTheDay.uppercaseString
        wotdTimeLbl.text = ExerciseManager.instance.getWorkoutTime(ExerciseManager.instance.wordOfTheDay)
        
//        //get workout time
//        print(ExerciseManager.instance.getWorkoutTime())
//
    }
    
    @IBAction func showAllExercises() {
        let allExercisesView = self.storyboard?.instantiateViewControllerWithIdentifier("AlphaView") as! AlphaVC
        self.presentViewController(allExercisesView, animated: true, completion: nil)
    }
    
    @IBAction func showWordExercises() {
        if let word = wordInput.text where word != "" {
            ExerciseManager.instance.setWorkoutForWord(word)
        
            let wordExercises = self.storyboard?.instantiateViewControllerWithIdentifier("WordView") as! WordVC
            self.presentViewController(wordExercises, animated: true, completion: nil)
        
        } else {
            print("no word")
        }
    }

    @IBAction func showWOTDExercises(sender: AnyObject) {
        ExerciseManager.instance.setWorkoutForWord("Feel the burn")
        
        let wordExercises = self.storyboard?.instantiateViewControllerWithIdentifier("WordView") as! WordVC
        self.presentViewController(wordExercises, animated: true, completion: nil)
    }

}


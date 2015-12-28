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
    
    @IBOutlet weak var errorLbl: UILabel!
    @IBOutlet weak var errorBgImg: UIImageView!
    @IBOutlet weak var errorCloseBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBarHidden = true
        
        wotdTitleLbl.text = ExerciseManager.instance.wordOfTheDay.uppercaseString
        wotdTimeLbl.text = ExerciseManager.instance.getWorkoutTime(ExerciseManager.instance.wordOfTheDay)
    }
    
    @IBAction func onErrorCloseBtnPress(sender: AnyObject) {
        errorLbl.hidden = true
        errorBgImg.hidden = true
        errorCloseBtn.hidden = true
    }
    @IBAction func showAllExercises() {
        performSegueWithIdentifier("AlphaSegue", sender: self)
    }
    
    @IBAction func showWordExercises() {
        if let word = wordInput.text where word != "" {
            ExerciseManager.instance.setWorkoutForWord(word)
            performSegueWithIdentifier("WordSegue", sender: self)
        } else {
            showError("Not a word")
        }
    }

    @IBAction func showWOTDExercises(sender: AnyObject) {
        ExerciseManager.instance.setWorkoutForWord("Feel the burn")
        performSegueWithIdentifier("WordSegue", sender: self)
    }
    
    func showError(msg: String) {
        errorLbl.text = msg
        
        errorLbl.hidden = false
        errorBgImg.hidden = false
        errorCloseBtn.hidden = false
    }

}


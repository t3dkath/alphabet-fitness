//
//  ViewController.swift
//  alphabet-fitness
//
//  Created by Kath Faulkner on 27/12/2015.
//  Copyright © 2015 T3D. All rights reserved.
//

import UIKit

class HomeVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var wordInput: UITextField!
    @IBOutlet weak var wotdTitleLbl: UILabel!
    @IBOutlet weak var wotdTimeLbl: UILabel!
    
    @IBOutlet weak var errorLbl: UILabel!
    @IBOutlet weak var errorBgImg: UIImageView!
    @IBOutlet weak var errorCloseBtn: UIButton!
    
    @IBOutlet weak var wotdBtn: UIButton!
    @IBOutlet weak var inputBtn: UIButton!
    @IBOutlet weak var exercisesBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBarHidden = true
        
        wordInput.delegate = self
        
        wotdTitleLbl.text = ExerciseManager.instance.wordOfTheDay.uppercaseString
        wotdTimeLbl.text = ExerciseManager.instance.getWorkoutTime(ExerciseManager.instance.wordOfTheDay)
    }
    
    @IBAction func onErrorCloseBtnPress(sender: AnyObject) {
        errorLbl.hidden = true
        errorBgImg.hidden = true
        errorCloseBtn.hidden = true
        
        wordInput.enabled = true
        wotdBtn.enabled = true
        inputBtn.enabled = true
        exercisesBtn.enabled = true
    }
    @IBAction func showAllExercises() {
        performSegueWithIdentifier("AlphaSegue", sender: self)
    }
    
    @IBAction func showWordExercises() {
        let word = wordInput.text!
        
        if isValidWord(word) {
            ExerciseManager.instance.setWorkoutForWord(word)
            performSegueWithIdentifier("WordSegue", sender: self)
        } else {
            showError("Hmm, we didn't detect a character string with any recognisable letters, please try again")
        }
    }

    @IBAction func showWOTDExercises(sender: AnyObject) {
        ExerciseManager.instance.setWorkoutForWord("Feel the burn")
        performSegueWithIdentifier("WordSegue", sender: self)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    
    func isValidWord(word: String?) -> Bool {
        if word == "" {
            return false
        }
        
        ExerciseManager.instance.setWorkoutForWord(word!)
        if ExerciseManager.instance.currentWorkout.count <= 0 {
            ExerciseManager.instance.setWorkoutForWord("")
            return false
        }
        
        
        return true
    }
    
    func showError(msg: String) {
        errorLbl.text = msg
        
        errorLbl.hidden = false
        errorBgImg.hidden = false
        errorCloseBtn.hidden = false
        
        wordInput.enabled = false
        wotdBtn.enabled = false
        inputBtn.enabled = false
        exercisesBtn.enabled = false
    }

}


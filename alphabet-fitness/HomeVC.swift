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
    @IBOutlet weak var randomWordTitleLbl: UILabel!
    @IBOutlet weak var randomWordTimeLbl: UILabel!
    
    @IBOutlet weak var errorLbl: UILabel!
    @IBOutlet weak var errorBgImg: UIImageView!
    @IBOutlet weak var errorCloseBtn: UIButton!
    
    @IBOutlet weak var randomWordBtn: UIButton!
    @IBOutlet weak var inputBtn: UIButton!
    @IBOutlet weak var exercisesBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBarHidden = true
        
        wordInput.delegate = self
        
        randomWordTitleLbl.text = ExerciseManager.instance.randomWord.uppercaseString
        randomWordTimeLbl.text = ExerciseManager.instance.getWorkoutTime(ExerciseManager.instance.randomWord)
    }
    
    @IBAction func onErrorCloseBtnPress(sender: AnyObject) {
        errorLbl.hidden = true
        errorBgImg.hidden = true
        errorCloseBtn.hidden = true
        
        wordInput.enabled = true
        randomWordBtn.enabled = true
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
            showError("Uh oh! Just letters please.")
        }
    }

    @IBAction func showRandomWordExercises(sender: AnyObject) {
        ExerciseManager.instance.setWorkoutForWord(ExerciseManager.instance.randomWord)
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
        randomWordBtn.enabled = false
        inputBtn.enabled = false
        exercisesBtn.enabled = false
    }

}


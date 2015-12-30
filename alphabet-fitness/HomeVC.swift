//
//  ViewController.swift
//  alphabet-fitness
//
//  Created by Kath Faulkner on 27/12/2015.
//  Copyright © 2015 T3D. All rights reserved.
//

import UIKit

class HomeVC: UIViewController, UITextFieldDelegate, BWWalkthroughViewControllerDelegate {
    
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
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeUp.direction = UISwipeGestureRecognizerDirection.Up
        self.view.addGestureRecognizer(swipeUp)
    }
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Up:
                if exercisesBtn.enabled {
                    showAllExercises()
                }
            default: break
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        if !userDefaults.boolForKey("walkthroughPresented") {
            showWalkthrough()
            userDefaults.setBool(true, forKey: "walkthroughPresented")
            userDefaults.synchronize()
        }
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    
    
    func showWalkthrough() {
        
        let stb = UIStoryboard(name: "Walkthrough", bundle: nil)
        let walkthrough = stb.instantiateViewControllerWithIdentifier("walk0") as! BWWalkthroughViewController
        let page_one = stb.instantiateViewControllerWithIdentifier("walk1") as UIViewController
        let page_two = stb.instantiateViewControllerWithIdentifier("walk2") as UIViewController
        
        walkthrough.delegate = self
        walkthrough.addViewController(page_one)
        walkthrough.addViewController(page_two)
        
        self.presentViewController(walkthrough, animated: true, completion: nil)
    }
    
    @IBAction func walkthroughCloseButtonPressed() {
        self.dismissViewControllerAnimated(true, completion: nil)
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
        ExerciseManager.instance.setWorkoutForWord("abcdefghijklmnopqrstuvwxyz")
        performSegueWithIdentifier("AlphaSegue", sender: self)
    }
    
    @IBAction func showWordExercises() {
        let word = wordInput.text!
        
        if isValidWord(word) {
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


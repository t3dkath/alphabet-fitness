//
//  ExerciseVC.swift
//  alphabet-fitness
//
//  Created by Kath Faulkner on 28/12/2015.
//  Copyright © 2015 T3D. All rights reserved.
//

import UIKit

class ExerciseVC: UIViewController {
    
    @IBOutlet weak var letterLbl: UILabel!
    @IBOutlet weak var exImage: UIImageView!
    @IBOutlet weak var exTitleLbl: UILabel!
    @IBOutlet weak var exDescLbl: UILabel!
    
    @IBOutlet weak var catTitleLbl: UILabel!
    @IBOutlet weak var catImage: UIImageView!
    
    @IBOutlet weak var nextExerciseBtn: UIButton!
    @IBOutlet weak var prevExerciseBtn: UIButton!
    
    var exercise: Exercise!
    var final: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadExerciseDetail()
    
        let swipeRight = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Right:
                if prevExerciseBtn.enabled {
                    onPrevExercisePress()
                } else {
                    backBtnPressed()
                }
            case UISwipeGestureRecognizerDirection.Left:
                if nextExerciseBtn.enabled {
                    onNextExercisePress()
                }
            default: break
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func backBtnPressed() {
        self.navigationController?.popViewControllerAnimated(true)
    }

    @IBAction func onNextExercisePress() {
        if !final {
            let newPos = ExerciseManager.instance.workoutPosition + 1
            ExerciseManager.instance.setWorkoutPosition(newPos)
            loadNewExercise()
        } else {
            performSegueWithIdentifier("FinishWorkout", sender: self)
        }
    }
    @IBAction func onPrevExercisePress() {
        let newPos = ExerciseManager.instance.workoutPosition - 1
        ExerciseManager.instance.setWorkoutPosition(newPos)
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    func loadNewExercise() {
        let nextExercise:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ExerciseView") as UIViewController
        
        self.navigationController?.pushViewController(nextExercise, animated: true)
    }
    
    
    func loadExerciseDetail() {
        prevExerciseBtn.enabled = true
        prevExerciseBtn.alpha = 1
        final = false
        
        if ExerciseManager.instance.workoutPosition >= ExerciseManager.instance.currentWorkout.count - 1 {
            nextExerciseBtn.setTitle("FINISH", forState: .Normal)
            final = true
        }
        if ExerciseManager.instance.workoutPosition == 0 {
            prevExerciseBtn.enabled = false
            prevExerciseBtn.alpha = 0.5
        }
        
        exercise = ExerciseManager.instance.currentWorkout[ExerciseManager.instance.workoutPosition]
        
        letterLbl.text = exercise.identifier
        exImage.image = exercise.image
        exTitleLbl.text = exercise.name
        exDescLbl.text = exercise.description
        
        catTitleLbl.text = exercise.category.name
        catImage.image = exercise.category.image
    }
    
}

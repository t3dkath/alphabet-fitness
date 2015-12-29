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
        
        nextExerciseBtn.layer.cornerRadius = 5.0
        prevExerciseBtn.layer.cornerRadius = 5.0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func backBtnPressed(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }

    @IBAction func onNextExercisePress(sender: AnyObject) {
        if !final {
            let newPos = ExerciseManager.instance.workoutPosition + 1
            ExerciseManager.instance.setWorkoutPosition(newPos)
            loadExerciseDetail()
        } else {
            performSegueWithIdentifier("FinishWorkout", sender: self)
        }
    }
    @IBAction func onPrevExercisePress(sender: AnyObject) {
        let newPos = ExerciseManager.instance.workoutPosition - 1
        ExerciseManager.instance.setWorkoutPosition(newPos)
        loadExerciseDetail()
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

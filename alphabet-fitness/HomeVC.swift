//
//  ViewController.swift
//  alphabet-fitness
//
//  Created by Kath Faulkner on 27/12/2015.
//  Copyright © 2015 T3D. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBarHidden = true
        
        //shuffle exercises
        ExerciseManager.instance.shuffleExercises()
        
        
        //get from parsed word
        ExerciseManager.instance.setWorkoutForWord("aa")
        let currentWorkout = ExerciseManager.instance.currentWorkout
        
        if currentWorkout.count > 0 {
            for exercise in currentWorkout {
                print(exercise.category)
            }
        } else {
            print("You entered a character string with no recognisable letters, please try again")
        }
        
        
        //get workout time
        print(ExerciseManager.instance.getWorkoutTime())
        
        
        //get only from single category
        let allExercises = ExerciseManager.instance.exerciseList
        let coreExercises = allExercises.filter( { return $0.category.name == "Core" } )
        print(coreExercises)
    }
    
    @IBAction func showAlphaVC() {
        //alphaView = AlphaVC()
        //self.presentViewController(alphaView, animated: true, completion: nil)
    }


}


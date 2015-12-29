//
//  ExerciseBuilder.swift
//  alphabet-fitness
//
//  Created by Kath Faulkner on 27/12/2015.
//  Copyright © 2015 T3D. All rights reserved.
//

import Foundation
import UIKit


class ExerciseManager {
    
    static let instance = ExerciseManager()
    
    private var _exerciseList = [Exercise]()
    private var _categoryList = [Category]()
    private var _wordoutWord = ""
    private var _currentWorkout = [Exercise]()
    private var _workoutPosition: Int = 0
    private var _randomWord: String = ""
    
    var exerciseList: [Exercise] { return _exerciseList }
    var categoryList: [Category] { return _categoryList }
    var workoutWord: String { return _wordoutWord }
    var currentWorkout: [Exercise] { return _currentWorkout }
    var workoutPosition: Int { return _workoutPosition }
    var randomWord: String { return _randomWord }
    
    let RANDOM_WORD_ARR = ["Feel the burn", "Fitness", "Witness the fitness", "Suck it up", "No pain, no gain", "Go hard or go home!", "Stay strong", "Do you even lift bro?", "Nailed it"]
    
    let ALPHABET = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    let CATEGORY_DICT = [
        ["id": "1", "name": "Core",        "image": "cat-core"],
        ["id": "2", "name": "Upper-body",  "image": "cat-arms"],
        ["id": "3", "name": "Plyometics",  "image": "cat-heart"],
        ["id": "4", "name": "Lower-body",  "image": "cat-legs"],
        ["id": "5", "name": "Full-body",  "image": "cat-legs"]
    ]
    var exercise_dict = [
        ["name": "Wall Sit", "image": "", "description": "", "category": "4"],
        ["name": "Press/Push-Up", "image": "", "description": "", "category": "2"],
        ["name": "Crunch", "image": "", "description": "", "category": "1"],
        ["name": "Bench Dip", "image": "", "description": "", "category": "2"],
        ["name": "Squat", "image": "", "description": "", "category": "4"],
        ["name": "Squat Jump", "image": "", "description": "", "category": "3"],
        ["name": "Incline Press/Push-Up", "image": "", "description": "", "category": "2"],
        ["name": "Jumping Jack", "image": "", "description": "", "category": "3"],
        ["name": "Burpee", "image": "", "description": "", "category": "3"],
        ["name": "Tuck Jump", "image": "", "description": "", "category": "3"],
        ["name": "Bear Crawl", "image": "", "description": "", "category": "5"],
        ["name": "Mountain Climber", "image": "", "description": "", "category": "5"],
        ["name": "Plank", "image": "", "description": "", "category": "1"],
        ["name": "Hollow Man", "image": "", "description": "", "category": "1"],
        ["name": "Lunge", "image": "", "description": "", "category": "4"],
        ["name": "Russian Twist", "image": "", "description": "", "category": "1"],
        ["name": "Bicycle Crunch", "image": "", "description": "", "category": "1"],
        ["name": "Calf Raise", "image": "", "description": "", "category": "4"],
        ["name": "Step Up", "image": "", "description": "", "category": "4"],
        ["name": "Bulgarian Split Squat", "image": "", "description": "", "category": "4"],
        ["name": "Sit Up", "image": "", "description": "", "category": "1"],
        ["name": "Reverse Crunch", "image": "", "description": "", "category": "1"],
        ["name": "Superman", "image": "", "description": "", "category": "1"],
        ["name": "Leg Raise", "image": "", "description": "", "category": "1"],
        ["name": "Glute Bridge", "image": "", "description": "", "category": "4"],
        ["name": "Spiderman Push-Up", "image": "", "description": "", "category": "2"]
        
    ]
    
    init() {
        self.setRandomWord()
        
        //if exercise list already in memory
            //loadexercise
        //else
            self.seedCategories()
            self.seedExercises()
    }
    
    private func seedCategories() {
        for category in CATEGORY_DICT {
            let cat = Category(id: category["id"]!, name: category["name"]!, image: UIImage(named: category["image"]!)!)
            self._categoryList.append(cat)
        }
    }
    
    private func seedExercises() {
        var i = 0
        for letter in ALPHABET {
            var exImage: UIImage!
            let exName = self.exercise_dict[i]["name"]
            let exDesc = self.exercise_dict[i]["description"]
            let exCat = self.categoryList.filter( { return $0.id == self.exercise_dict[i]["category"] } )
            
            if let img = UIImage(named: self.exercise_dict[i]["image"]!) {
                exImage = img
            } else {
                exImage = UIImage(named: "_exercise")
            }
            
            let exercise = Exercise(identifier: letter, name: exName!, image: exImage!, description: exDesc!, category: exCat.first!)
            self._exerciseList.append(exercise)
            i++
        }
        
        //save exercise list
    }
    
    private func setRandomWord() {
        let rand = arc4random_uniform(UInt32(self.RANDOM_WORD_ARR.count))
        self._randomWord = self.RANDOM_WORD_ARR[Int(rand)]
    }
    
    func getWorkoutTime(workout: String? = "") -> String {
        
        if workout != "" {
            setWorkoutForWord(workout!)
        }
        
        let workoutTimeInSeconds = (_currentWorkout.count * 40) - 10
        let wcMinutes: Int = Int(workoutTimeInSeconds / 60)
        let wcSecounds: Int = Int(workoutTimeInSeconds - (wcMinutes * 60))
        var workoutTime = ""
        
        if wcMinutes != 0 {
            workoutTime += "\(wcMinutes) "
            if wcMinutes == 1 { workoutTime += "MINUTE " }
            else { workoutTime += "MINUTES " }
        }
        
        if wcMinutes != 0 && wcSecounds != 0 { workoutTime += "& " }
        
        if wcSecounds != 0 {
            workoutTime += "\(wcSecounds) "
            if wcSecounds == 1 { workoutTime += "SECOND" }
            else { workoutTime += "SECONDS" }
        }
        
        if workoutTime == "-10 SECONDS" {
            workoutTime = "0 SECONDS"
        }
        return workoutTime
    }
    
    func shuffleExercises() {
        self._exerciseList = [Exercise]()
        exercise_dict.shuffleInPlace()
        seedExercises()
    }
    
    func getExerciseAt(alpha: String) -> Exercise? {
        var idExercise: Exercise?
        
        for exercise in _exerciseList {
            if alpha == exercise.identifier {
                idExercise = exercise
            }
        }
        return idExercise
    }
    
    func setWorkoutForWord(word: String) {
        self._wordoutWord = word
        self._currentWorkout = [Exercise]()
        
        let wordArray = Array(word.uppercaseString.characters)
        for letter in wordArray {
            if let exercise = getExerciseAt(String(letter)) {
                self._currentWorkout.append(exercise)
            }
        }
    }
    
    func setWorkoutPosition(pos: Int) {
        self._workoutPosition = pos
    }
    
    func getWorkoutsForCategory(categoryId: String) -> [Exercise] {
        let categoryExercises = self._exerciseList.filter( { return $0.category.id == categoryId } )
        return categoryExercises
    }
    
}
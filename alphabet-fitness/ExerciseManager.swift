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
    
    let EXERCISE_KEY = "exercises"
    
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
        ["name": "Wall Sit", "image": "", "description": "Stand with your back against a wall and slowly bend your knees until you are at a right-angle. Now, don’t move! …and remember to keep your back straight.", "category": "4"],
        ["name": "Press/Push-Up", "image": "", "description": "Place your hands shoulder-width apart, keep your core tight and back straight. Bend your elbows until your chest touches the floor, and then straighten your arms to push back up to the starting position.", "category": "2"],
        ["name": "Crunch", "image": "", "description": "Lie on the floor with your knees bent and feet flat. With your hands behind your head, curl your upper back off the floor and engage your core. Then slowly lower yourself back to the starting position.", "category": "1"],
        ["name": "Bench Dip", "image": "", "description": "With a bench or step behind you, sit on the floor with your legs stretched out in front. Place your hands on the bench behind you, and press yourself up. Then slowly lower yourself down by bending your elbows.", "category": "2"],
        ["name": "Squat", "image": "", "description": "Stand with your feet facing forward and legs hip-width apart. Slowly bend your knees and lower yourself until your thighs are parallel to the floor.  Finally straighten your legs to return to the start position. Remember to keep your back straight and keep your heels on the floor, and remember to make sure your front knee doesn’t move past your toes.", "category": "4"],
        ["name": "Squat Jump", "image": "", "description": "Stand with your feet facing forward and legs hip-width apart. Slowly bend your knees and lower yourself until your thighs are parallel to the floor.  Now jump up explosively and as you land move your body back in to the  squat position and repeat.", "category": "3"],
        ["name": "Incline Press/Push-Up", "image": "", "description": "Place your hands shoulder-width apart and your feet on a bench or step, keep your core tight and back straight. Bend your elbows until your chest touches the floor, and then straighten your arms to push back up to the starting position.", "category": "2"],
        ["name": "Jumping Jack", "image": "", "description": "From a standing position jump and spread your legs to the side, and at the same time lift your arms out wide and above your head. Keep up your momentum, this is a classic!", "category": "3"],
        ["name": "Burpee", "image": "", "description": "From a standing position squat down and place your hands one the floor in front of you. Lean on to your hands and kick out your legs backwards in to the press-up position. Then, bring your knees back up to your chest to get back in to the square positions. Lastly, jump up in to the air. Once you land quickly repeat.", "category": "3"],
        ["name": "Tuck Jump", "image": "", "description": "With your knees slightly bent, jump straight up as high as you can, bringing your knees up to your chest and extend your arms straight out. Once you land quickly repeat.", "category": "3"],
        ["name": "Bear Crawl", "image": "", "description": "Start on your hands and knees, then rise up onto your toes. keep your core tight and crawl forward out your right arm and right kneed, followed by the left arm and leg knee. Repeat this around the room.", "category": "5"],
        ["name": "Mountain Climber", "image": "", "description": "Start on your hands and knees, then bring your left knee up towards your chest while straightening your left leg. Keeping your core tight, jump and switch legs. Then, repeat.", "category": "5"],
        ["name": "Plank", "image": "", "description": "Start face down leaning in your forearms and hands clasped. Extend your legs behind you.  Keep your back straight and core engaged. Now, don’t move! …and remember to keep your back straight.", "category": "1"],
        ["name": "Hollow Man Hold", "image": "", "description": "Lie on your back with your arms and legs stretched out. Engage your core and slowly raise your arms, head, shoulders and legs from the ground. Remember to keep your lower back on the floor.", "category": "1"],
        ["name": "Lunge", "image": "", "description": "From a standing position place your hands on your hips and take along stride foreword.  Then slowly lower your body until your knee is close to the floor. Push back up in to the starting position, and repeat with the opposite leg.", "category": "4"],
        ["name": "Bicycle Crunch", "image": "", "description": "Lie on the floor with your knees bent and feet flat. Lift your legs off the ground and make a pedalling motion. With your hands behind your head, bring your opposite elbow to meet each leg as it comes toward you.", "category": "1"],
        ["name": "Calf Raise", "image": "", "description": "Start in a standing position, slowly rise up on to your toes. Hold this position briefly and the lower your heels back to the floor, and repeat.", "category": "4"],
        ["name": "Step Up", "image": "", "description": "Using a bench or a step, step up with one foot on to the raised surface, the bring the other footer up and stand up  straight. Then step down and repeat. ", "category": "4"],
        ["name": "Bulgarian Split Squat", "image": "", "description": "Stand in front of a bench or step, place one foot on the bench. Keeping your back straight lower your body until your rear knee touches the ground, then slowly push back up to the start position.  Repeat a few times weight each leg, and remember to make sure your front knee doesn’t move past your toes.", "category": "4"],
        ["name": "Sit Up", "image": "", "description": "Lie on your back with your knees bent and feet flat. With your hands behind your head, engage your core and lift your back off the floor so your elbows meet your knees. Then slowly lower yourself back to the starting position.", "category": "1"],
        ["name": "Reverse Crunch", "image": "", "description": "Lie on your back with your knees bent and feet flat. Lift your knees and pull them towards your chest raising your buttocks off the floor. Try and keep your arms and upper-body flat to the floor and engage your core.", "category": "1"],
        ["name": "Superman", "image": "", "description": "Lie face down with your arms our stretched in front of you in Superman’s flying position. Raise your legs, arms and torso off the ground and squeeze your glutes.", "category": "1"],
        ["name": "Leg Raise", "image": "", "description": "Lie with your back on the ground with your legs out straight. Engage your core and lift your legs, keeping them straight, until they are at 90 degrees, Then, lower your legs slowly to the ground and repeat.", "category": "1"],
        ["name": "Glute Bridge", "image": "", "description": "Lie on your back with your knees bent at 90 degrees. Keep your arms by your sides and push through your heels to lift your hips as high as possible. Briefly hold and tighten your gluten, then slowly return to the start position, and repeat.", "category": "4"],
        ["name": "Spiderman Push-Up", "image": "", "description": "Place your hands shoulder-width apart, keep your core tight and back straight. Bend your elbows until your chest touches the floor, at the same time bring one knee up towards your elbow. Then straighten your arms to push back up to the starting position and straighten your leg. Then repeat using the other leg.", "category": "2"],
        ["name": "L-Sit", "image": "", "description": "Sit on the floor with your feel out in front of you and your arms by your sides. From this position lift your body off the floor while trying to keep your legs out in front.", "category": "1"]
        
    ]
    
    init() {
        self.setRandomWord()
        self.seedCategories()
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        if (userDefaults.objectForKey(EXERCISE_KEY) == nil) {
            self.seedExercises()
        } else {
            self.loadPosts()
        }
        
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
        
        self.savePosts()
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
    
    
    
    func savePosts() {
        let postsData = NSKeyedArchiver.archivedDataWithRootObject(_exerciseList)
        NSUserDefaults.standardUserDefaults().setObject(postsData, forKey: EXERCISE_KEY)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func loadPosts() {
        if let postsData = NSUserDefaults.standardUserDefaults().objectForKey(EXERCISE_KEY) as? NSData {
            if let postsArray = NSKeyedUnarchiver.unarchiveObjectWithData(postsData) as? [Exercise] {
                _exerciseList = postsArray
            }
        }
    }
    

    
}
//
//  AlphaVC.swift
//  alphabet-fitness
//
//  Created by Kath Faulkner on 28/12/2015.
//  Copyright © 2015 T3D. All rights reserved.
//

import UIKit

class AlphaVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.contentInset = UIEdgeInsetsMake(45, 0, 0, 0)
    
        let swipeDown = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeDown.direction = UISwipeGestureRecognizerDirection.Down
        self.view.addGestureRecognizer(swipeDown)
    }
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Down:
                backBtnPressed()
            default: break
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func backBtnPressed() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func shuffleBtnPressed(sender: AnyObject) {
        ExerciseManager.instance.shuffleExercises()
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("ExerciseCell") as? ExerciseCell {
            cell.configureCell(ExerciseManager.instance.exerciseList[indexPath.row])
            return cell
            
        } else {
            return ExerciseCell()
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ExerciseManager.instance.exerciseList.count
    }
}

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
    }
    
    
    @IBAction func backBtnPressed(sender: AnyObject) {
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

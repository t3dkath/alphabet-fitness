//
//  ViewController.swift
//  alphabet-fitness
//
//  Created by Kath Faulkner on 29/12/2015.
//  Copyright © 2015 T3D. All rights reserved.
//

import UIKit

class FinishedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func onFinishWorkoutPressed(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    

}

//
//  TransitionVCOne.swift
//  Transitions
//
//  Created by alex livenson on 11/1/14.
//  Copyright (c) 2014 alex.livenson. All rights reserved.
//

import UIKit

class TransitionVC: UIViewController {

//    let transitionManager = TransitionManager_1()
    let transitionManager = TransitionManager_2()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToViewController(sender: UIStoryboardSegue) {
        println("VC has unwinded")
    }

    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let toViewController = segue.destinationViewController as UIViewController
        
        // Where we now use transition manager to controller style
        toViewController.transitioningDelegate = self.transitionManager
    }

}

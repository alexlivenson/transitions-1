//
//  TransitionManager_2.swift
//  Transitions
//
//  Created by alex livenson on 11/1/14.
//  Copyright (c) 2014 alex.livenson. All rights reserved.
//

import UIKit

class TransitionManager_2: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        // TODO
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 0.5
    }
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
   
}

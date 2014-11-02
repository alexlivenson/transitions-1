//
//  TransitionManager.swift
//  Transitions
//
//  Created by alex livenson on 11/1/14.
//  Copyright (c) 2014 alex.livenson. All rights reserved.
//

import UIKit

class TransitionManager_1: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
    // is used to toggle which direction to transition
    private var presenting = true
    
    // animate a change from one vc to another
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        // reference for toView, fromView, and container view wher transition occurs
        let container = transitionContext.containerView()
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        
        // set up 2D transforms that we will use in the animation
        let offScreenRight = CGAffineTransformMakeTranslation( container.frame.width, 0)
        let offScreenLeft = CGAffineTransformMakeTranslation( -container.frame.width, 0)
        
        // prepare the toView for the animations
        if self.presenting {
            toView.transform = offScreenRight
        } else {
            toView.transform = offScreenLeft
        }
        
        // add both views to super view
        container.addSubview(toView)
        container.addSubview(fromView)
        
        // get duration animation (don't just type 0.5)
        let duration = self.transitionDuration(transitionContext)
        
        // Perform animation
        // Using spring with damping for a little bounce
        UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.8, options: nil, animations: {
            if self.presenting {
                fromView.transform = offScreenLeft
                toView.transform = CGAffineTransformIdentity
            } else {
                fromView.transform = offScreenRight
                toView.transform = CGAffineTransformIdentity
            }
            
            }, completion: { finished in
                transitionContext.completeTransition(true)
        })
        
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 1.0
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = false
        return self
    }
    
   
}

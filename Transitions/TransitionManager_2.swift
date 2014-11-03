//
//  TransitionManager_2.swift
//  Transitions
//
//  Created by alex livenson on 11/1/14.
//  Copyright (c) 2014 alex.livenson. All rights reserved.
//

import UIKit

class TransitionManager_2: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
    private var presenting = true
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        // get references
        let container = transitionContext.containerView()
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
        
        // set up 2D transforms
        let π: CGFloat = 3.1415265359
        let offScreenRotateIn = CGAffineTransformMakeRotation( -π / 2)
        let offScreenRotateOut = CGAffineTransformMakeRotation( π / 2 )
        
        // set start location for view (depending on going forward or back)
        toView.transform = self.presenting ? offScreenRotateIn : offScreenRotateOut
        
        // Set anchor point so rotations happen on top left point
        toView.layer.anchorPoint = CGPoint(x: 0, y: 0)
        fromView.layer.anchorPoint = CGPoint(x: 0, y: 0)
        
        // Updating anchor also moves the center position so we need to compensate by moving center point at top left
        toView.layer.position = CGPoint(x: 0, y: 0)
        fromView.layer.position = CGPoint(x: 0, y: 0)

        
        container.addSubview(toView)
        container.addSubview(fromView)
        
        let duration = 1.0
        
        UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.8, options: nil, animations:  {
            if self.presenting {
                fromView.transform = offScreenRotateOut
            } else {
                fromView.transform = offScreenRotateIn
            }
            
            toView.transform = CGAffineTransformIdentity
            }, completion: { finished in
                transitionContext.completeTransition(true)
                
        })
        
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 0.5
    }
    
    // these get called before the animationTransition
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = false
        return self
    }
    
   
}

//
//  PresentMenuAnimator.swift
//  TwoDirectionalScroller
//
//  Created by Robert Chen on 3/31/16.
//  Copyright © 2016 Thorn Technologies. All rights reserved.
//

import UIKit

class PresentMenuAnimator : NSObject {
}

extension PresentMenuAnimator : UIViewControllerAnimatedTransitioning {
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.6
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        guard
            let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey),
            let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey),
            let containerView = transitionContext.containerView()
            else {
                return
        }
        containerView.insertSubview(toVC.view, belowSubview: fromVC.view)
        
        // replace main view with snapshot
        let snapshot = fromVC.view.snapshotViewAfterScreenUpdates(false)
        snapshot.tag = MenuHelper.snapshotCardinalNumber
        snapshot.userInteractionEnabled = false
        snapshot.layer.shadowOpacity = 0.7
        containerView.insertSubview(snapshot, aboveSubview: toVC.view)
        fromVC.view.hidden = true
        // figure out where to move the main view snapshot to
        let screenBounds = UIScreen.mainScreen().bounds
        let finalFrameTopLeftCorner = CGPoint(x: screenBounds.width * MenuHelper.menuWidth, y: 0)
        let snapshotFinalFrame = CGRect(origin: finalFrameTopLeftCorner, size: screenBounds.size)
        
        UIView.animateWithDuration(
            transitionDuration(transitionContext),
            animations: {
                snapshot.frame = snapshotFinalFrame
            },
            completion: { _ in
                fromVC.view.hidden = false
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
            }
        )
    }
}
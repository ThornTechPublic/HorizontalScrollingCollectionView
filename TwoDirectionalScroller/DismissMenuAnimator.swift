//
//  DismissMenuAnimator.swift
//  TwoDirectionalScroller
//
//  Created by Robert Chen on 3/31/16.
//  Copyright © 2016 Thorn Technologies. All rights reserved.
//

import UIKit

class DismissMenuAnimator : NSObject {
}

extension DismissMenuAnimator : UIViewControllerAnimatedTransitioning {
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
        let snapshot = containerView.viewWithTag(MenuHelper.snapshotCardinalNumber)
        
        UIView.animateWithDuration(
            transitionDuration(transitionContext),
            animations: {
                snapshot?.frame = CGRect(origin: CGPoint.zero, size: UIScreen.mainScreen().bounds.size)
            },
            completion: { _ in
                let didTransitionComplete = !transitionContext.transitionWasCancelled()
                if didTransitionComplete {
                    containerView.insertSubview(toVC.view, aboveSubview: fromVC.view)
                    snapshot?.removeFromSuperview()
                }
                transitionContext.completeTransition(didTransitionComplete)
            }
        )
    }
}
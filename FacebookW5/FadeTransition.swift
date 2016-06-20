//
//  FadeTransition.swift
//  transitionDemo
//
//  Created by Timothy Lee on 11/4/14.
//  Copyright (c) 2014 Timothy Lee. All rights reserved.
//

import UIKit

class FadeTransition: BaseTransition {

    var blackView: UIView!
  
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        
        let toViewController = toViewController as! PhotoViewController
        let fromViewController = fromViewController as! FeedViewController
        
        blackView = UIView()
        blackView.backgroundColor = UIColor(white: 0, alpha: 0.7)
        blackView.frame.size = containerView.frame.size
        blackView.alpha = 0
        containerView.insertSubview(blackView, belowSubview: toViewController.view)
        
        toViewController.view.alpha = 0
        UIView.animateWithDuration(duration, animations: {
            
            toViewController.view.alpha = 1
            self.blackView.alpha = 1
            
        }) { (finished: Bool) -> Void in
            self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        fromViewController.view.alpha = 1
        self.blackView.alpha = 1
        UIView.animateWithDuration(duration, animations: {
            fromViewController.view.alpha = 0
            self.blackView.alpha = 0
        }) { (finished: Bool) -> Void in
            self.finish()
        }
    }
}

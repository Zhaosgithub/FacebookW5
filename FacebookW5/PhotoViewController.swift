//
//  PhotoViewController.swift
//  FacebookW5
//
//  Created by Zhaochang He on 6/18/16.
//  Copyright © 2016 Zhaochang He. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var DoneButton: UIButton!
    @IBOutlet weak var TabBar: UIImageView!
    
    var image: UIImage!
    var originalCenter: CGPoint!
    
    
//    var animalImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

      imageView.image = image
        
//        imageView.image = animalImage
        
     scrollView.contentSize = CGSize(width: 320, height: 800)
     scrollView.delegate = self
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
    @IBAction func didTapDone(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        // This method is called as the user scrolls
        
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView!) {
        UIView.animateWithDuration(0.5) { () -> Void in
           self.DoneButton.alpha = 0.2
           self.imageView.alpha = 0.5
           self.TabBar.alpha = 0.2
//             self.scrollView.alpha = 0.7
        }
        
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView!,
        willDecelerate decelerate: Bool) {
            // This method is called right as the user lifts their finger
            if scrollView.center.y > 100 {
                UIView.animateWithDuration(0.5) { () -> Void in
                    self.dismissViewControllerAnimated(true, completion: nil)
                }
                
                if scrollView.center.y < 100 {
                    self.scrollView.alpha = 1
                }
            
            }
          
            
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView!) {
     
        // This method is called when the scrollview finally stops scrolling.
    }

    
    @IBAction func didPanPhoto(sender: UIPanGestureRecognizer) {
        
        var translation = sender.translationInView(view)
        
        if sender.state == UIGestureRecognizerState.Began {
            print("Gesture began")
            originalCenter = scrollView.center
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            print("Gesture is changing")
            scrollView.center = CGPoint(x: originalCenter.x, y: originalCenter.y+translation.y)

            if translation.y > 100 {
                dismissViewControllerAnimated(true, completion: nil)
            }
            
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            print("Gesture ended")
            
            if translation.y > 50 {
                dismissViewControllerAnimated(true, completion: nil)
            } else {
                self.scrollView.alpha = 1
                scrollView.center = originalCenter
            }
            
        }
            
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

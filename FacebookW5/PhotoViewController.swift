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
//    var contentOffset: CGFloat
    
    
//    var animalImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

      imageView.image = image
        
//        imageView.image = animalImage
        
     scrollView.contentSize = CGSize(width: 320, height: 800)
     scrollView.delegate = self
        
//     contentOffset = 100
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
//           self.DoneButton.alpha = 0.2
//           self.imageView.alpha = 0.5
//           self.TabBar.alpha = 0.2
             self.scrollView.alpha = 0.7
        }
        
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView!,
        willDecelerate decelerate: Bool) {
            // This method is called right as the user lifts their finger
            
            UIView.animateWithDuration(0.5) { () -> Void in
//                self.DoneButton.alpha = 1
//                self.imageView.alpha = 1
//                self.TabBar.alpha = 1
                self.scrollView.alpha = 1
            }
            
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView!) {
        // This method is called when the scrollview finally stops scrolling.
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

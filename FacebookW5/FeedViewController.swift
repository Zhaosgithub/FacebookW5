//
//  FeedViewController.swift
//  FacebookW5
//
//  Created by Zhaochang He on 6/18/16.
//  Copyright © 2016 Zhaochang He. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var imageView: UIImageView!    
    @IBOutlet weak var imageViewTwo: UIImageView!
    
    var fadeTransition: FadeTransition!
//    var selectedImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = feedImageView.image!.size
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onTapPhoto(sender: UITapGestureRecognizer) {
       //onTap this image will call the func to link to the photoView
        performSegueWithIdentifier("firstSegue", sender: nil)
        
     
//        selectedImageView = sender.view as! UIImageView
        
        
        
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let destinationViewController = segue.destinationViewController as! PhotoViewController
        
//            destinationViewController.animalImage = selectedImageView.image
        
        destinationViewController.image = imageView.image
        
         
        
        // Set the modal presentation style of your destinationViewController to be custom.
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        
        // Create a new instance of your fadeTransition.
        fadeTransition = FadeTransition()
        
        // Tell the destinationViewController's  transitioning delegate to look in fadeTransition for transition instructions.
        destinationViewController.transitioningDelegate = fadeTransition
        
        // Adjust the transition duration. (seconds)
        fadeTransition.duration = 1
    
    }
    

}

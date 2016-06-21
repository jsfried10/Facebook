//
//  NewsFeedViewController.swift
//  Facebook
//
//  Created by Jeremy Friedland on 5/19/16.
//  Copyright © 2016 Jeremy Friedland. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController {

   
    var refreshControl: UIRefreshControl!
    
    var imageTransition: ImageTransition!
    var fadeTransition: FadeTransition!
    var selectedImageView: UIImageView!
    
    @IBOutlet weak var newsFeedScrollView: UIScrollView!
    @IBOutlet weak var viewLoadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var ptrLoadingview: UIActivityIndicatorView!
    
    @IBOutlet weak var newsFeedImage: UIImageView!
    
    @IBOutlet weak var weddingImage1: UIImageView!
    @IBOutlet weak var weddingImage2: UIImageView!
    @IBOutlet weak var weddingImage3: UIImageView!
    @IBOutlet weak var weddingImage4: UIImageView!
    @IBOutlet weak var weddingImage5: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        newsFeedScrollView.contentSize = CGSize(width: 320, height: 1468)
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(NewsFeedViewController.onRefresh), forControlEvents: UIControlEvents.ValueChanged)
        
        newsFeedScrollView.insertSubview(refreshControl, atIndex: 0)
    }
    
    func onRefresh(){
        ptrLoadingview.startAnimating()
        delay(2, closure: {
            self.refreshControl.endRefreshing()
            self.ptrLoadingview.stopAnimating()
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        //activity indicator
        newsFeedImage.hidden = true
        weddingImage1.hidden = true
        weddingImage2.hidden = true
        weddingImage3.hidden = true
        weddingImage4.hidden = true
        weddingImage5.hidden = true
        viewLoadingIndicator.startAnimating()
    }
    
    override func viewDidAppear(animated: Bool) {
        delay(0.2) {
            self.newsFeedImage.hidden = false
            self.weddingImage1.hidden = false
            self.weddingImage2.hidden = false
            self.weddingImage3.hidden = false
            self.weddingImage4.hidden = false
            self.sweddingImage5.hidden = false
            self.viewLoadingIndicator.stopAnimating()
        }
    }
    

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        let destinationViewController = segue.destinationViewController as! MediaViewController
        
        destinationViewController.weddingImage = selectedImageView.image
        
        // Set the modal presentation style of your destinationViewController to be custom.
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        
        // Create a new instance of your fadeTransition.
        imageTransition = ImageTransition()
        
        // Tell the destinationViewController's  transitioning delegate to look in fadeTransition for transition instructions.
        destinationViewController.transitioningDelegate = imageTransition
        
        // Adjust the transition duration. (seconds)
        imageTransition.duration = 0.5
        
        
        
    }
    
    @IBAction func didTapPhoto(sender: UITapGestureRecognizer) {
        
        selectedImageView = sender.view as! UIImageView
        
        performSegueWithIdentifier("mediaSegue", sender: self)
        
    }

}

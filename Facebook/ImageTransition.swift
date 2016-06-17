//
//  ImageTransition.swift
//  Facebook
//
//  Created by Jeremy Friedland on 6/16/16.
//  Copyright © 2016 Jeremy Friedland. All rights reserved.
//

import UIKit

class ImageTransition: BaseTransition {
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        let newsfeedViewController = fromViewController as! NewsFeedViewController
        let mediaViewController = toViewController as! MediaViewController
        
        let movingImageView = UIImageView()
        movingImageView.frame = containerView.convertRect(newsfeedViewController.selectedImageView.frame, fromView: newsfeedViewController.selectedImageView.superview)
        movingImageView.image = newsfeedViewController.selectedImageView.image
        movingImageView.contentMode = newsfeedViewController.selectedImageView.contentMode

        
        newsfeedViewController.selectedImageView.hidden = true
        containerView.addSubview(movingImageView)
        
        toViewController.view.alpha = 0
        mediaViewController.weddingImageView.hidden = true
        
        UIView.animateWithDuration(duration, animations: {
            toViewController.view.alpha = 1
            movingImageView.frame = mediaViewController.weddingImageView.frame
            
        }) { (finished: Bool) -> Void in
            newsfeedViewController.selectedImageView.hidden = true
            mediaViewController.weddingImageView.hidden = false
            movingImageView.removeFromSuperview()

            self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        let newsfeedViewController = toViewController as! NewsFeedViewController
        let mediaViewController = fromViewController as! MediaViewController
        
        let movingImageView = UIImageView()
        movingImageView.frame = containerView.convertRect(mediaViewController.weddingImageView.frame, fromView: newsfeedViewController.selectedImageView.superview)
        movingImageView.image = mediaViewController.weddingImageView.image
        movingImageView.contentMode = mediaViewController.weddingImageView.contentMode
        
        mediaViewController.weddingImageView.hidden = true
        newsfeedViewController.selectedImageView.hidden = true
        containerView.addSubview(movingImageView)
        
        toViewController.view.alpha = 1
        
        UIView.animateWithDuration(duration, animations: {
            fromViewController.view.alpha = 0
            movingImageView.frame = newsfeedViewController.selectedImageView.frame

        }) { (finished: Bool) -> Void in
            newsfeedViewController.selectedImageView.hidden = false
//            mediaViewController.weddingImageView.hidden = true
            
            movingImageView.removeFromSuperview()
            
            self.finish()
        }
    }


}

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
        
        let tabViewController = fromViewController as! UITabBarController
        let navigationController = tabViewController.selectedViewController as! UINavigationController
        let newsfeedViewController = navigationController.topViewController as! NewsFeedViewController
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
            
            //calc aspect ratio of selected image
            let aspectRatio = movingImageView.image!.size.width / movingImageView.image!.size.height
            
            
            //respect width of image transitioning to and set the height to preserve the aspect ratio
            movingImageView.frame.size.width = mediaViewController.weddingImageView.frame.size.width
            movingImageView.frame.size.height = movingImageView.frame.size.width / aspectRatio
            
            //line up center of the image views to match
            movingImageView.center = mediaViewController.weddingImageView.center
            
        }) { (finished: Bool) -> Void in
            newsfeedViewController.selectedImageView.hidden = true
            mediaViewController.weddingImageView.hidden = false
            movingImageView.removeFromSuperview()

            self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        let tabViewController = toViewController as! UITabBarController
        let navigationController = tabViewController.selectedViewController as! UINavigationController
        let newsfeedViewController = navigationController.topViewController as! NewsFeedViewController
        let mediaViewController = fromViewController as! MediaViewController

        
        let movingImageView = UIImageView()
//        movingImageView.frame = containerView.convertRect(mediaViewController.weddingImageView.frame, fromView: mediaViewController.weddingImageView.superview)

        movingImageView.image = mediaViewController.weddingImageView.image
        movingImageView.contentMode = newsfeedViewController.selectedImageView.contentMode
        
//        calculate aspect ratio of the selected image
        let aspectRatio = movingImageView.image!.size.width / movingImageView.image!.size.height
        
        movingImageView.frame.size.width = mediaViewController.weddingImageView.frame.size.width
        movingImageView.frame.size.height = movingImageView.frame.size.width / aspectRatio
        
        movingImageView.center = mediaViewController.weddingImageView.center
        
        mediaViewController.weddingImageView.hidden = true
        newsfeedViewController.selectedImageView.hidden = true
        containerView.addSubview(movingImageView)
        
        toViewController.view.alpha = 1
        
        UIView.animateWithDuration(duration, animations: {
            fromViewController.view.alpha = 0
            movingImageView.frame = containerView.convertRect(newsfeedViewController.selectedImageView.frame, fromView: newsfeedViewController.selectedImageView.superview)
            
        }) { (finished: Bool) -> Void in
            newsfeedViewController.selectedImageView.hidden = false
//            mediaViewController.weddingImageView.hidden = true
            
            movingImageView.removeFromSuperview()
            
            self.finish()
        }
    }


}

//
//  MediaViewController.swift
//  Facebook
//
//  Created by Jeremy Friedland on 6/16/16.
//  Copyright © 2016 Jeremy Friedland. All rights reserved.
//

import UIKit

class MediaViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    var weddingImage: UIImage!

    @IBOutlet weak var weddingImageView: UIImageView!
    
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var photoActionsView: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: 320, height: 600)
        weddingImageView.image = weddingImage

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
        
        let translation = scrollView.contentOffset
        let alpha = convertValue(CGFloat(translation.y), r1Min: 0, r1Max: -100, r2Min: 1, r2Max: 0)
        
        scrollView.backgroundColor = UIColor(white: 0, alpha: alpha)
        photoActionsView.alpha = alpha
        doneButton.alpha = alpha
        
    }
    
    
    func scrollViewDidEndDragging(scrollView: UIScrollView!,
                                  willDecelerate decelerate: Bool) {
        if scrollView.contentOffset.y > 100 || scrollView.contentOffset.y < -100 {
            dismissViewControllerAnimated(true, completion: nil)
        }
    
    }
    
    
    func viewForZoomingInScrollView(scrollView: UIScrollView!) -> UIView! {
        return weddingImageView
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

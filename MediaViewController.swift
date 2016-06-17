//
//  MediaViewController.swift
//  Facebook
//
//  Created by Jeremy Friedland on 6/16/16.
//  Copyright © 2016 Jeremy Friedland. All rights reserved.
//

import UIKit

class MediaViewController: UIViewController {

    var weddingImage: UIImage!

    @IBOutlet weak var weddingImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

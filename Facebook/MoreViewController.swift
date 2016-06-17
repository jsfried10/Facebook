//
//  MoreViewController.swift
//  Facebook
//
//  Created by Jeremy Friedland on 5/19/16.
//  Copyright © 2016 Jeremy Friedland. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController {

    @IBOutlet weak var MoreScrollView: UIScrollView!
    @IBOutlet weak var settingsImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        MoreScrollView.contentSize = settingsImage.frame.size
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLogout(sender: AnyObject) {
        let logoutAlertController = UIAlertController(title: nil, message: "Are you sure you want to log out?", preferredStyle: .ActionSheet)
        
        let logoutAction = UIAlertAction(title: "Log Out", style: .Destructive) { (action) in
            // do stuff
            
            self.performSegueWithIdentifier("logoutSegue", sender: self)
        }
        
        logoutAlertController.addAction(logoutAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
            // do stuff
        }
    
        logoutAlertController.addAction(cancelAction)
        
        presentViewController(logoutAlertController, animated: true) {
            
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

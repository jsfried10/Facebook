//
//  NotificationsViewController.swift
//  Facebook
//
//  Created by Jeremy Friedland on 5/19/16.
//  Copyright © 2016 Jeremy Friedland. All rights reserved.
//

import UIKit

class NotificationsViewController: UIViewController {

    @IBOutlet weak var NotificationsScrollView: UIScrollView!
    @IBOutlet weak var ScrollImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        NotificationsScrollView.contentSize = CGSize(width: ScrollImage.image!.size.width, height: ScrollImage.image!.size.height + 50)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

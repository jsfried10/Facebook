//
//  ThrillistViewController.swift
//  Facebook
//
//  Created by Jeremy Friedland on 5/19/16.
//  Copyright © 2016 Jeremy Friedland. All rights reserved.
//

import UIKit

class ThrillistViewController: UIViewController {

    @IBOutlet weak var ThrillistScrollView: UIScrollView!
    @IBOutlet weak var ComposerBar: UIView!
    
    var initialY: CGFloat!
    var offset: CGFloat!
   
    override func viewDidLoad() {
        super.viewDidLoad()

    ThrillistScrollView.contentSize = CGSize(width: 320, height: 1025)
        // Do any additional setup after loading the view.
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIKeyboardWillShowNotification, object: nil)

        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIKeyboardWillHideNotification, object: nil)
        
        initialY = ComposerBar.frame.origin.y
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onButtonLike(sender: UIButton) {
        
        sender.selected = true
    }

    @IBAction func CloseKeyboard(sender: AnyObject) {
        view.endEditing(true)
        
    }
    
    @IBAction func exitedPermalink(sender: UIButton) {
        navigationController!.popViewControllerAnimated(true)
    }
    
    
    func keyboardWillShow(notification: NSNotification!) {
        
        let frame = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        
       offset = frame.size.height
        
        ComposerBar.frame.origin.y = initialY - offset + 50

        
        
    }
    
    
    func keyboardWillHide(notification: NSNotification!) {
        
        
        ComposerBar.frame.origin.y = initialY
        
        
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

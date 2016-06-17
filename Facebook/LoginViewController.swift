//
//  LoginViewController.swift
//  Facebook
//
//  Created by Jeremy Friedland on 5/26/16.
//  Copyright © 2016 Jeremy Friedland. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var fbLogo: UIImageView!
    @IBOutlet weak var fieldSuperView: UIView!
    @IBOutlet weak var labelSuperView: UIView!
    
    @IBOutlet weak var signUpLabel: UILabel!
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    // variables
    var fbLogoInitialY: CGFloat!
    var fieldInitialY: CGFloat!
    var labelInitialY: CGFloat!
    
    var fbOffset: CGFloat!
    var fieldOffset: CGFloat!
    var labelOffset: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillShow(_:)), name:UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillHide(_:)), name:UIKeyboardWillHideNotification, object: nil)
        
        // assign values
        fbLogoInitialY = fbLogo.frame.origin.y
        fieldInitialY = fieldSuperView.frame.origin.y
        labelInitialY = labelSuperView.frame.origin.y
        
        fbOffset = -25
        fieldOffset = -50
        labelOffset = -210
        
        
         loginButton.enabled = false
    }

    @IBAction func fieldEdit(sender: AnyObject) {
        if emailField.text!.isEmpty || passwordField.text!.isEmpty {
            loginButton.enabled = false
        } else {
            loginButton.enabled = true
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        fbLogo.frame.origin.y = fbLogoInitialY + fbOffset
        fieldSuperView.frame.origin.y = fieldInitialY + fieldOffset
        labelSuperView.frame.origin.y = labelInitialY + labelOffset
        
        // animate the alpha of
        UIView.animateWithDuration(0.3) { 
            self.signUpLabel.alpha = 0.0
        }
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        fbLogo.frame.origin.y = fbLogoInitialY
        fieldSuperView.frame.origin.y = fieldInitialY
        labelSuperView.frame.origin.y = labelInitialY
        
        // animate the alpha of
        UIView.animateWithDuration(0.3) {
            self.signUpLabel.alpha = 1.0
        }
    }

    @IBAction func didTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    
    @IBAction func didLogin(sender: UIButton) {
        
        sender.selected = true
        
        activityView.startAnimating()
        
        if emailField.text == "email" && passwordField.text == "pass"{
            
            delay(2, closure: { 
                self.activityView.stopAnimating()
                self.loginButton.selected = false
                
                self.performSegueWithIdentifier("loginSegue", sender: nil)
                
            })
        
        } else {
            
            delay(2, closure: { 
                self.activityView.stopAnimating()
                self.loginButton.selected = false
                
                let alertController = UIAlertController(title: "Failure", message: "Try again", preferredStyle: .Alert)
                
                let cancelAction = UIAlertAction(title: "Ok", style: .Cancel) { (action) in
                
                }
                
                alertController.addAction(cancelAction)
                
                self.presentViewController(alertController, animated: true) {
                    
                }
                
            })
        
        }
        
    }
}

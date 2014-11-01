
//
//  LoginViewController.swift
//  NEWSATHacker
//
//  Created by Kedan Li on 14/10/31.
//  Copyright (c) 2014年 Kedan Li. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var login : UIButton!
    @IBOutlet var signup : UIButton!
    @IBOutlet var findPass : UIButton!

    @IBOutlet var email : UITextField!
    @IBOutlet var pass : UITextField!
    
    var scrollertapController: UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        login.addTarget(self, action: "login:", forControlEvents: UIControlEvents.TouchUpInside)
        signup.addTarget(self, action: "signup:", forControlEvents: UIControlEvents.TouchUpInside)
        findPass.addTarget(self, action: "forgetPass:", forControlEvents: UIControlEvents.TouchUpInside)
        
        scrollertapController = UITapGestureRecognizer(target: self, action: "backgroundTapped:")
        var tapController = UITapGestureRecognizer(target: self, action: "backgroundTapped:")
        self.view.addGestureRecognizer(tapController)
        
        // Do any additional setup after loading the view.
    }

    func textFieldDidBeginEditing(textField: UITextField) {
        
        if (self.parentViewController?.parentViewController as MainViewController).isToTop{
            (self.parentViewController?.parentViewController as MainViewController).autoScroll()
        }
        (self.parentViewController?.parentViewController as MainViewController).scroller.scrollEnabled = false
        (self.parentViewController?.parentViewController as MainViewController).scroller.addGestureRecognizer(scrollertapController)

    }
    func textFieldDidEndEditing(textField: UITextField) {
        (self.parentViewController?.parentViewController as MainViewController).scroller.scrollEnabled = true
        (self.parentViewController?.parentViewController as MainViewController).scroller.removeGestureRecognizer(scrollertapController)
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == email{
            email.resignFirstResponder()
            pass.becomeFirstResponder()
        }else if textField == pass{
            pass.resignFirstResponder()
            (self.parentViewController?.parentViewController as MainViewController).scroller.scrollEnabled = true
            (self.parentViewController?.parentViewController as MainViewController).scroller.removeGestureRecognizer(scrollertapController)


        }
        return true
    }
    
    @IBAction func backgroundTapped(recognizer : UITapGestureRecognizer) {
        
        if email.isFirstResponder(){
            email.resignFirstResponder()
            (self.parentViewController?.parentViewController as MainViewController).scroller.scrollEnabled = true
            (self.parentViewController?.parentViewController as MainViewController).scroller.removeGestureRecognizer(scrollertapController)
        }else if pass.isFirstResponder(){
            pass.resignFirstResponder()
            (self.parentViewController?.parentViewController as MainViewController).scroller.scrollEnabled = true
            (self.parentViewController?.parentViewController as MainViewController).scroller.removeGestureRecognizer(scrollertapController)

        }else{
            (self.parentViewController?.parentViewController as MainViewController).autoScroll()
        }
        
    }

    
    @IBAction func login(sender : AnyObject) {
        (self.parentViewController as NewsBoard).displayView("login")
    }
    @IBAction func forgetPass(sender : AnyObject) {
        (self.parentViewController as NewsBoard).displayView("forgetpass")
    }
    @IBAction func signup(sender : AnyObject) {
        (self.parentViewController as NewsBoard).displayView("signup")
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

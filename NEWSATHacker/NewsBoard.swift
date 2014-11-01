//
//  NewsBoard.swift
//  NEWSATHacker
//
//  Created by Kedan Li on 14/10/30.
//  Copyright (c) 2014年 Kedan Li. All rights reserved.
//

import UIKit

class NewsBoard: UIViewController {

    @IBOutlet var scroller : UIScrollView!
    
    @IBOutlet var emailLogin : UITextField!
    @IBOutlet var passLogin : UITextField!

    @IBOutlet var login : UIButton!
    @IBOutlet var signup : UIButton!

    var loginContent : UIViewController!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        var gestureReco = UITapGestureRecognizer(target: self, action: "boardUp:")
        self.scroller.addGestureRecognizer(gestureReco)
        
        loginContent = self.storyboard!.instantiateViewControllerWithIdentifier("login")! as UIViewController
        self.displayContentController(loginContent)
        // Do any additional setup after loading the view.
    }
    
    func displayContentController(content: UIViewController){
        self.addChildViewController(content)
        content.didMoveToParentViewController(self)          // 3
        self.view.addSubview(content.view)
        var gestureReco = UITapGestureRecognizer(target: self, action: "boardUp:")
        content.view.addGestureRecognizer(gestureReco)
    }

    func hideContentController(content: UIViewController){
        content.view.removeFromSuperview()
        content.removeFromParentViewController()
    }
    
    @IBAction func boardUp(recognizer : UITapGestureRecognizer) {
        (self.parentViewController as MainViewController).moveUp()
        recognizer.removeTarget(self, action: "boardUp:")
        recognizer.addTarget(self, action: "boardDown:")
    }
    
    @IBAction func boardDown(recognizer : UITapGestureRecognizer) {
        
        (self.parentViewController as MainViewController).moveDown()
        recognizer.removeTarget(self, action: "boardDown:")
        recognizer.addTarget(self, action: "boardUp:")

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

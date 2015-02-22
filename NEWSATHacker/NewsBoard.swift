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

    var loginContent : UIViewController!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        var gestureReco = UITapGestureRecognizer(target: self, action: "boardUp:")
        self.scroller.addGestureRecognizer(gestureReco)
        
        loginContent = self.storyboard!.instantiateViewControllerWithIdentifier("login")! as UIViewController
        self.displayContentController(loginContent)
        // Do any additional setup after loading the view.
    }
    
    func displayView(identifier: String){
        
        UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
            
            self.loginContent.view.alpha = 0
            
            }
            , completion: {
                (value: Bool) in
                self.hideContentController(self.loginContent)
                self.loginContent = self.storyboard!.instantiateViewControllerWithIdentifier(identifier)! as UIViewController
                self.displayContentController(self.loginContent)

        })
    }
    
    func displayContentController(content: UIViewController){
        self.addChildViewController(content)
        content.didMoveToParentViewController(self)          // 3
        content.view.alpha = 0
        self.view.addSubview(content.view)
        
        UIView.animateWithDuration(0.5, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
            
            self.loginContent.view.alpha = 1
            
            }
            , completion: {
                (value: Bool) in
                
        })

    }

    func hideContentController(content: UIViewController){
        content.view.removeFromSuperview()
        content.removeFromParentViewController()
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

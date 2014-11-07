//
//  ChoicesViewController.swift
//  NEWSATHacker
//
//  Created by Kedan Li on 14/11/3.
//  Copyright (c) 2014年 Kedan Li. All rights reserved.
//

import UIKit

class ChoicesViewController: UIViewController {

    @IBOutlet var a : UIButton!
    @IBOutlet var b : UIButton!
    @IBOutlet var c : UIButton!
    @IBOutlet var d : UIButton!
    @IBOutlet var e : UIButton!
    @IBOutlet var u : UIButton!

    var parentView: TakeTestViewController!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(animated: Bool) {
        
        parentView = self.parentViewController as TakeTestViewController
        
        var aLab = UILabel(frame: CGRectMake(0, 0, a.frame.width, a.frame.height))
        aLab.text = "A"
        aLab.textAlignment = NSTextAlignment.Center
        aLab.textColor = UIColor.whiteColor()
        aLab.font = UIFont(name: "AvenirNext-Medium", size: 38)
        a.addSubview(aLab)

        aLab = UILabel(frame: CGRectMake(1, 1, a.frame.width, a.frame.height))
        aLab.text = "B"
        aLab.textAlignment = NSTextAlignment.Center
        aLab.textColor = UIColor.whiteColor()
        aLab.font = UIFont(name: "AvenirNext-Medium", size: 38)
        b.addSubview(aLab)
        
        aLab = UILabel(frame: CGRectMake(-2, 2, a.frame.width, a.frame.height))
        aLab.text = "C"
        aLab.textAlignment = NSTextAlignment.Center
        aLab.textColor = UIColor.whiteColor()
        aLab.font = UIFont(name: "AvenirNext-Medium", size: 38)
        c.addSubview(aLab)
        
        aLab = UILabel(frame: CGRectMake(1, 1, a.frame.width, a.frame.height))
        aLab.text = "D"
        aLab.textAlignment = NSTextAlignment.Center
        aLab.textColor = UIColor.whiteColor()
        aLab.font = UIFont(name: "AvenirNext-Medium", size: 38)
        d.addSubview(aLab)
        
        aLab = UILabel(frame: CGRectMake(0, 1, a.frame.width, a.frame.height))
        aLab.text = "E"
        aLab.textAlignment = NSTextAlignment.Center
        aLab.textColor = UIColor.whiteColor()
        aLab.font = UIFont(name: "AvenirNext-Medium", size: 38)
        e.addSubview(aLab)
        
        aLab = UILabel(frame: CGRectMake(0, 1, a.frame.width, a.frame.height))
        aLab.text = "?"
        aLab.textAlignment = NSTextAlignment.Center
        aLab.textColor = UIColor.whiteColor()
        aLab.font = UIFont(name: "AvenirNext-Medium", size: 38)
        u.addSubview(aLab)
        
        a.addTarget(self, action: "choose:", forControlEvents: UIControlEvents.TouchUpInside)
        b.addTarget(self, action: "choose:", forControlEvents: UIControlEvents.TouchUpInside)
        c.addTarget(self, action: "choose:", forControlEvents: UIControlEvents.TouchUpInside)
        d.addTarget(self, action: "choose:", forControlEvents: UIControlEvents.TouchUpInside)
        e.addTarget(self, action: "choose:", forControlEvents: UIControlEvents.TouchUpInside)
        u.addTarget(self, action: "choose:", forControlEvents: UIControlEvents.TouchUpInside)

    }

    @IBAction func choose(sender: AnyObject){
        
        var theChoice: String = ((sender as UIButton).subviews[1] as UILabel).text!
        
        (parentView.childViewControllers[2] as DraggerViewController).choiceChosen(theChoice, question: parentView.currentQuestion)

    }
    
    func toLandscape(){
        let trans = CGAffineTransformMakeRotation(3.14 / 2)
        a.transform = trans
        b.transform = trans
        c.transform = trans
        d.transform = trans
        e.transform = trans
        u.transform = trans

    }
    
    func toPortrait(){
        let trans = CGAffineTransformMakeRotation(0)
        a.transform = trans
        b.transform = trans
        c.transform = trans
        d.transform = trans
        e.transform = trans
        u.transform = trans
        
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

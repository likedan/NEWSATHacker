//
//  MainViewController.swift
//  NEWSATHacker
//
//  Created by Kedan Li on 14/10/25.
//  Copyright (c) 2014年 Kedan Li. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var top : UIView!

    @IBOutlet var bottom : UIView!

    @IBOutlet var mainBoard : MathWritingReading!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mainBoard = MathWritingReading(frame: CGRectMake(0, 75, 320, 450))
        self.mainBoard.userInteractionEnabled = true
        self.view.addSubview(self.mainBoard)
        
        self.mainBoard.math.addTarget(self, action: "mathClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor(red: 240.0/255, green: 242.0/255, blue: 245.0/255, alpha: 1)
        
    }
    
    @IBAction func mathClicked(sender: AnyObject){
        
        self.mainBoard.chosen()
        
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

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

    @IBOutlet var satHacker : UILabel!
    @IBOutlet var menu : UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        //Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor(red: 240.0/255, green: 242.0/255, blue: 245.0/255, alpha: 1)
        
    }
    
    @IBAction func mathClicked(sender: AnyObject){
        
        
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

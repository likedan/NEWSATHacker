//
//  MenuTableViewController.swift
//  NEWSATHacker
//
//  Created by Kedan Li on 14/11/2.
//  Copyright (c) 2014年 Kedan Li. All rights reserved.
//

import UIKit

class MenuTableViewController: UIViewController, UIScrollViewDelegate{
    
    @IBOutlet var scroller : UIScrollView!
    @IBOutlet var settings : UIButton!
    @IBOutlet var account : UIButton!
    @IBOutlet var ranking : UIButton!
    @IBOutlet var buyTests : UIButton!
    @IBOutlet var history : UIButton!
    @IBOutlet var aboutUs : UIButton!
    @IBOutlet var guidance : UIButton!
    @IBOutlet var friends : UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scroller.contentSize = CGSizeMake(200, 600)
        scroller.showsVerticalScrollIndicator = false
        
        var itemBack = UIImageView(frame: CGRectMake(0, 0, 200, 40))
        itemBack.alpha = 0.7
        
        //itemBack.frame = UIColor(red: 111.0/255, green: 111.0/255, blue: 111.0/255, alpha: 1)
        
        
        // Do any additional setup after loading the view.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
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

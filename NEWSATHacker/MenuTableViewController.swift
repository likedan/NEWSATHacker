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
        scroller.showsHorizontalScrollIndicator = false
        

        
        var itemBack = UIImage(named: "line.png")
        var itemBackView = UIImageView(image: itemBack)
        //self.view.addSubview(itemBackView)

        account.setBackgroundImage(itemBack, forState: UIControlState.Normal)
        
        settings.setBackgroundImage(itemBack, forState: UIControlState.Normal)

        ranking.setBackgroundImage(itemBack, forState: UIControlState.Normal)

        buyTests.setBackgroundImage(itemBack, forState: UIControlState.Normal)

        history.setBackgroundImage(itemBack, forState: UIControlState.Normal)

        aboutUs.setBackgroundImage(itemBack, forState: UIControlState.Normal)
        
        guidance.setBackgroundImage(itemBack, forState: UIControlState.Normal)
        
        friends.setBackgroundImage(itemBack, forState: UIControlState.Normal)
        



        
        //itemBack.alpha = 0.7
        
        
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

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
    
    @IBOutlet var personal : UILabel!
    @IBOutlet var options : UILabel!
    @IBOutlet var more : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scroller.contentSize = CGSizeMake(200, 600)
        scroller.showsVerticalScrollIndicator = false
        scroller.showsHorizontalScrollIndicator = false
        

        
        var itemBack = UIImage(named: "line.png")
        var itemBackView = UIImageView(image: itemBack)
        //self.view.addSubview(itemBackView)

        account.setBackgroundImage(itemBack, forState: UIControlState.Normal)
        account.titleLabel?.font = UIFont(name: "AvenirNext-DemiBold", size: 18)
        account.tintColor = UIColor(red: 124.0/255, green: 194.0/255, blue: 228.0/255, alpha: 1)

        
        settings.setBackgroundImage(itemBack, forState: UIControlState.Normal)
        settings.titleLabel?.font = UIFont(name: "AvenirNext-DemiBold", size: 18)
        settings.tintColor = UIColor(red: 124.0/255, green: 194.0/255, blue: 228.0/255, alpha: 1)


        ranking.setBackgroundImage(itemBack, forState: UIControlState.Normal)
        ranking.titleLabel?.font = UIFont(name: "AvenirNext-DemiBold", size: 18)
        ranking.tintColor = UIColor(red: 124.0/255, green: 194.0/255, blue: 228.0/255, alpha: 1)


        buyTests.setBackgroundImage(itemBack, forState: UIControlState.Normal)
        buyTests.titleLabel?.font = UIFont(name: "AvenirNext-DemiBold", size: 18)
        buyTests.tintColor = UIColor(red: 124.0/255, green: 194.0/255, blue: 228.0/255, alpha: 1)


        history.setBackgroundImage(itemBack, forState: UIControlState.Normal)
        history.titleLabel?.font = UIFont(name: "AvenirNext-DemiBold", size: 18)
        history.tintColor = UIColor(red: 124.0/255, green: 194.0/255, blue: 228.0/255, alpha: 1)


        aboutUs.setBackgroundImage(itemBack, forState: UIControlState.Normal)
        aboutUs.titleLabel?.font = UIFont(name: "AvenirNext-DemiBold", size: 18)
        aboutUs.tintColor = UIColor(red: 124.0/255, green: 194.0/255, blue: 228.0/255, alpha: 1)


        guidance.setBackgroundImage(itemBack, forState: UIControlState.Normal)
        guidance.titleLabel?.font = UIFont(name: "AvenirNext-DemiBold", size: 18)
        guidance.tintColor = UIColor(red: 124.0/255, green: 194.0/255, blue: 228.0/255, alpha: 1)


        friends.setBackgroundImage(itemBack, forState: UIControlState.Normal)
        friends.titleLabel?.font = UIFont(name: "AvenirNext-DemiBold", size: 18)
        friends.tintColor = UIColor(red: 124.0/255, green: 194.0/255, blue: 228.0/255, alpha: 1)


        


        var titleBack = UIImage(named: "titleline")
        var titleBackView = UIImageView(image: titleBack)
        titleBackView.frame = CGRectMake(0, 0, 200, 40)
        
        
        personal.addSubview(titleBackView)
        
        titleBackView = UIImageView(image: titleBack)
        titleBackView.frame = CGRectMake(0, 0, 200, 40)
        
        options.addSubview(titleBackView)
        
        titleBackView = UIImageView(image: titleBack)
        titleBackView.frame = CGRectMake(0, 0, 200, 40)
        
        more.addSubview(titleBackView)

        
        

        
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

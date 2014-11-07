//
//  MenuTableViewController.swift
//  NEWSATHacker
//
//  Created by Kedan Li on 14/11/2.
//  Copyright (c) 2014年 Kedan Li. All rights reserved.
//

import UIKit

class MenuTableViewController: UIViewController, UIScrollViewDelegate{
    
    @IBOutlet var menuLabel : UILabel!
    
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
        
        scroller.contentSize = CGSizeMake(200, 508)
        scroller.showsVerticalScrollIndicator = false
        scroller.showsHorizontalScrollIndicator = false
        

        
        var itemBack = UIImage(named: "line.png")
        var itemBackView = UIImageView(image: itemBack)
        //self.view.addSubview(itemBackView)
        var itemColor = UIColor(red: 148.0/255, green: 148.0/255, blue: 148.0/255, alpha: 1)
        
        

        account.setBackgroundImage(itemBack, forState: UIControlState.Normal)
        account.titleLabel?.font = UIFont(name: "Avenir Next", size: 18)
        account.tintColor = itemColor

        
        settings.setBackgroundImage(itemBack, forState: UIControlState.Normal)
        settings.titleLabel?.font = UIFont(name: "Avenir Next", size: 18)
        settings.tintColor = itemColor


        ranking.setBackgroundImage(itemBack, forState: UIControlState.Normal)
        ranking.titleLabel?.font = UIFont(name: "Avenir Next", size: 18)
        ranking.tintColor = itemColor


        buyTests.setBackgroundImage(itemBack, forState: UIControlState.Normal)
        buyTests.titleLabel?.font = UIFont(name: "Avenir Next", size: 18)
        buyTests.tintColor = itemColor


        history.setBackgroundImage(itemBack, forState: UIControlState.Normal)
        history.titleLabel?.font = UIFont(name: "Avenir Next", size: 18)
        history.tintColor = itemColor


        aboutUs.setBackgroundImage(itemBack, forState: UIControlState.Normal)
        aboutUs.titleLabel?.font = UIFont(name: "Avenir Next", size: 18)
        aboutUs.tintColor = itemColor


        guidance.setBackgroundImage(itemBack, forState: UIControlState.Normal)
        guidance.titleLabel?.font = UIFont(name: "Avenir Next", size: 18)
        guidance.tintColor = itemColor


        friends.setBackgroundImage(itemBack, forState: UIControlState.Normal)
        friends.titleLabel?.font = UIFont(name: "Avenir Next", size: 18)
        friends.tintColor = itemColor

        


        var titleBack = UIImage(named: "titleline")
        var titleBackView = UIImageView(image: titleBack)
        titleBackView.frame = CGRectMake(0, 0, 200, 40)
        
        var titleColor = UIColor(red: 79.0/255, green: 78.0/255, blue: 78.0/255, alpha: 1)
        
        
        personal.addSubview(titleBackView)
        personal.font = UIFont(name: "AvenirNext-DemiBold", size: 18)
        personal.textColor = titleColor
            
        titleBackView = UIImageView(image: titleBack)
        titleBackView.frame = CGRectMake(0, 0, 200, 40)
        
        options.addSubview(titleBackView)
        options.font = UIFont(name: "AvenirNext-DemiBold", size: 18)
        options.textColor = titleColor

        titleBackView = UIImageView(image: titleBack)
        titleBackView.frame = CGRectMake(0, 0, 200, 40)
        
        more.addSubview(titleBackView)
        more.font = UIFont(name: "AvenirNext-DemiBold", size: 18)
        more.textColor = titleColor

        menuLabel.textColor = titleColor

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

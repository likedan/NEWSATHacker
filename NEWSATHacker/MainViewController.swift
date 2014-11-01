//
//  MainViewController.swift
//  NEWSATHacker
//
//  Created by Kedan Li on 14/10/25.
//  Copyright (c) 2014年 Kedan Li. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UIScrollViewDelegate{
    
    @IBOutlet var satHacker : UILabel!
    @IBOutlet var menu : UIButton!
    
    @IBOutlet var triangle : UIImageView!
    @IBOutlet var choose : UIView!
    @IBOutlet var news: UIView!

    @IBOutlet var scroller : UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scroller.contentSize = CGSizeMake(320, 600)
        scroller.showsVerticalScrollIndicator = false
        //Do any additional setup after loading the view.
        //self.view.backgroundColor = UIColor(red: 240.0/255, green: 242.0/255, blue: 245.0/255, alpha: 1)
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        choose.frame = CGRectMake(scrollView.contentOffset.y, scrollView.contentOffset.y, choose.frame.width, choose.frame.height)
        choose.alpha = 1 - scrollView.contentOffset.y / 200
    }
    
    func moveDown(){
        
        UIView.animateWithDuration(0.5, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
            
            self.triangle.center = CGPointMake(self.triangle.center.x, self.triangle.center.y + 300)
            self.choose.center = CGPointMake(self.choose.center.x, self.choose.center.y + 300)
            self.news.center = CGPointMake(self.news.center.x, self.news.center.y + 300)
            
            }
            , completion: {
                (value: Bool) in
                
        })
    }
    
    func moveUp(){
        
        UIView.animateWithDuration(0.5, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
            
            self.triangle.center = CGPointMake(self.triangle.center.x, self.triangle.center.y - 300)
            self.choose.center = CGPointMake(self.choose.center.x, self.choose.center.y - 300)
            self.news.center = CGPointMake(self.news.center.x, self.news.center.y - 300)

            }
            , completion: {
                (value: Bool) in

        })

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

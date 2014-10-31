//
//  ChooseTest.swift
//  NEWSATHacker
//
//  Created by Kedan Li on 14/10/30.
//  Copyright (c) 2014年 Kedan Li. All rights reserved.
//

import UIKit

class ChooseTest: UIViewController {

    @IBOutlet var scroller : UIScrollView!
    
    var chapters:[String:AnyObject] = [String:AnyObject]()
    
    var currentStatus:[AnyObject] = [AnyObject]()
    
    var level: Int = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chapters = DataManager.getChapInfo()
        
        println(chapters)
        
        initializeViews(chapters.keys.array)
        
        // Do any additional setup after loading the view.
    }

    func initializeViews(arr: [AnyObject]){
        
        self.addButtons(0, arr: arr)
        
    }
    
    func addButtons(number: Int, arr: [AnyObject]){
        
        println(arr[number])
        
        var button = UIButton(frame: CGRectMake(0, -80, 320, 90))
        button.addTarget(self, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        
        var line = UIImageView(frame: CGRectMake(60, 75, 290, 4))
        line.backgroundColor = UIColor.whiteColor()
        var angle = CGAffineTransformMakeRotation(0.22);
        angle = CGAffineTransformTranslate(angle, 0, 0);
        button.transform = angle
        button.addSubview(line)
        
        var label = UILabel(frame: CGRectMake(0, 0, 304, 110))
        label.text = arr[number] as? String
        label.font = UIFont(name: "AvenirNext-Medium", size: 32)
        label.textAlignment = NSTextAlignment.Right
        label.textColor = UIColor.whiteColor()
        
        button.addSubview(label)
        
        scroller.addSubview(button)

        
        UIView.animateWithDuration(0.5, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
            
            button.frame = CGRectMake(0, 10 + 90 * CGFloat(number), 320, 90)
            
            }
            , completion: {
                (value: Bool) in
                if number < arr.count - 1{
                    self.addButtons(number + 1, arr: arr)
                }
        })
        
    }
    
    @IBAction func buttonClicked(sender: AnyObject){
        
        currentStatus.append((sender.subviews[1] as UILabel).text!)
        
    }
    
    func disappearButton(){
        
        UIView.animateWithDuration(0.5, delay: 0.3, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
            
            self.scroller.alpha = 0
            
            }
            , completion: {
                (value: Bool) in
               
        })
        
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

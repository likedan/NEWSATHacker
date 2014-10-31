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
        
        initializeButtons()
        
        // Do any additional setup after loading the view.
    }

    func initializeButtons(){
        
        self.scroller.alpha = 1
        
        if chapters.count == 0{
            println(chapters.keys.array)
            self.addButtons(0, arr: chapters.keys.array)
        }else{
            
            var array: AnyObject = chapters
            
            for (var index = 0; index < currentStatus.count; index++){
                array = array[currentStatus[index] as String]!!
            }

            self.addButtons(0, arr: (array as [String: AnyObject]).keys.array)
            
        }
        
    }
    
    func addButtons(number: Int, arr: [AnyObject]){
        
        var angle = CGAffineTransformMakeRotation(0.22);
        
        var button = UIButton(frame: CGRectMake(320, 80 + 90 * CGFloat(number), 260, 90))
        button.addTarget(self, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside)

        var line = UIImageView(frame: CGRectMake(-0, 80, 290, 4))
        line.backgroundColor = UIColor.whiteColor()
        line.transform = angle
        button.addSubview(line)
        
        var label = UILabel(frame: CGRectMake(-60, 0, 304, 110))
        label.text = arr[number] as? String
        label.font = UIFont(name: "AvenirNext-Medium", size: 32)
        label.textAlignment = NSTextAlignment.Right
        label.textColor = UIColor.whiteColor()
        label.transform = angle

        button.addSubview(label)
        scroller.addSubview(button)

        
        UIView.animateWithDuration(0.2, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
            
            button.frame = CGRectMake(60, 10 + 90 * CGFloat(number), 260, 90)
            
            }
            , completion: {
                (value: Bool) in
                self.scroller.contentSize = CGSizeMake(self.scroller.frame.width, button.frame.origin.y + button.frame.height)
                if number < arr.count - 1{
                    self.addButtons(number + 1, arr: arr)
                }
                println(button.frame.origin.y + button.frame.height)
        })
        
    }
    
    @IBAction func buttonClicked(sender: AnyObject){
        
        currentStatus.append((sender.subviews[1] as UILabel).text!)
        self.disappearButtons()
        
    }
    
    func disappearButtons(){
        
        UIView.animateWithDuration(0.5, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
            
            self.scroller.alpha = 0
            
            }
            , completion: {
                (value: Bool) in
                for item in self.scroller.subviews{
                    item.removeFromSuperview()
                }
                self.initializeButtons()
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

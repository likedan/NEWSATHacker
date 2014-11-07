//
//  ChooseTest.swift
//  NEWSATHacker
//
//  Created by Kedan Li on 14/10/30.
//  Copyright (c) 2014年 Kedan Li. All rights reserved.
//

import UIKit

class ChooseTest: UIViewController, UITextFieldDelegate{

    @IBOutlet var scroller : UIScrollView!
    @IBOutlet var stateButton : UIView!
    
    var chapters:[String:AnyObject] = [String:AnyObject]()
    
    var currentStatus:[AnyObject] = [AnyObject]()

    var stateButtons:[AnyObject] = [AnyObject]()
    
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

            self.addButtons(0, arr: chapters.keys.array)
        }else{
            
            var array: AnyObject = chapters
            
            for (var index = 0; index < currentStatus.count; index++){
                array = array[currentStatus[index] as String]!!
            }

            if array.isEqual(""){
                // Check if the it is the last level
                takeTest()
                
            }else{
                self.addButtons(0, arr: (array as [String: AnyObject]).keys.array)
            }

        }
        
        var gestureReco = UIScreenEdgePanGestureRecognizer(target: self, action: "dragged:")
        gestureReco.edges = UIRectEdge.Left
        self.scroller.addGestureRecognizer(gestureReco)
        
    }
    
    @IBAction func dragged(recognizer : UIScreenEdgePanGestureRecognizer) {
    
        let translation = recognizer.translationInView(self.view)

        if translation.x > 0{
            self.scroller.alpha = 1 - translation.x / 200
        }
        if recognizer.state == UIGestureRecognizerState.Cancelled || recognizer.state == UIGestureRecognizerState.Failed || recognizer.state == UIGestureRecognizerState.Ended{
            
            if currentStatus.count > 0{
                currentStatus.removeAtIndex(currentStatus.count - 1)
                self.disappearButtons()
                self.changeStateButton()
            }else{
                UIView.animateWithDuration(0.2, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                    
                    self.scroller.alpha = 1
                    
                    }
                    , completion: {
                        (value: Bool) in
                })
            }
        }
    }
    
    func createStateButton(){
        
        for (var index = 0; index < currentStatus.count; index++){
            
            var label = UILabel(frame: CGRectMake(20, 0, 10, stateButton.frame.height))
            label.text = currentStatus[index] as? String
            //label.text = label.text! + "😉"
            label.font = UIFont(name: "AvenirNext-Medium", size: 20)
            label.textAlignment = NSTextAlignment.Center
            label.textColor = UIColor.whiteColor()
            label.sizeToFit()
            label.alpha = 0
            
            var button: UIButton!
            if stateButtons.count == 0 {
            
                button = UIButton(frame: CGRectMake(10, 0, label.frame.width + 20, label.frame.height))
            }else{
                button = UIButton(frame: CGRectMake((stateButtons[stateButtons.count - 1] as UIView).frame.origin.x + (stateButtons[stateButtons.count - 1] as UIView).frame.width, 0, label.frame.width + 20, label.frame.height))
            }
            
            button.addTarget(self, action: "returnButtonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
            button.addSubview(label)
            stateButton.addSubview(button)
            stateButtons.append(button)
            
            var img = UIImageView(frame: CGRectMake(0, 3, 20, 20))
            img.image = UIImage(named:"backWhite")
            //img.transform = CGAffineTransformMakeRotation(3.14)
            button.addSubview(img)
            
            var delay: NSTimeInterval = NSTimeInterval(index) * 0.2
            
            UIView.animateWithDuration(0.2, delay: delay, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                
                label.alpha = 1
                
                }
                , completion: {
                    (value: Bool) in
            })


        }
    }
    
    func changeStateButton(){
        
        UIView.animateWithDuration(0.2, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
            
            self.stateButton.alpha = 0
            
            }
            , completion: {
                (value: Bool) in
                for item in self.stateButton.subviews{
                    item.removeFromSuperview()
                }
                self.stateButtons = [AnyObject]()
                self.createStateButton()
                self.stateButton.alpha = 1

        })
        
    }
    
    func addButtons(number: Int, arr: [AnyObject]){
        
        var angle = CGAffineTransformMakeRotation(0.242);
        
        var button = UIButton(frame: CGRectMake(320, 80 + 90 * CGFloat(number), 260, 90))
        button.addTarget(self, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside)

        var line = UIImageView(frame: CGRectMake(-0, 40, 290, 4))
        line.backgroundColor = UIColor.whiteColor()
        line.transform = angle
        button.addSubview(line)
        
        var label = UILabel(frame: CGRectMake(-60, -40, 304, 110))
        label.text = arr[number] as? String
        label.font = UIFont(name: "AvenirNext-Medium", size: 32)
        label.textAlignment = NSTextAlignment.Right
        label.textColor = UIColor.whiteColor()
        label.transform = angle

        button.addSubview(label)
        scroller.addSubview(button)
        
        UIView.animateWithDuration(0.1, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
            
            button.frame = CGRectMake(60, 10 + 90 * CGFloat(number), 260, 90)
            
            }
            , completion: {
                (value: Bool) in
                self.scroller.contentSize = CGSizeMake(self.scroller.frame.width, button.frame.origin.y + button.frame.height + 20)
                if number < arr.count - 1{
                    self.addButtons(number + 1, arr: arr)
                }
        })
        
    }
    
    @IBAction func returnButtonClicked(sender: AnyObject){
    
        for (var index = currentStatus.count - 1; index >= 0; index--){
             if currentStatus[index] as String == (sender.subviews[0] as UILabel).text!{
                currentStatus.removeAtIndex(index);
                break;
            }else{
                currentStatus.removeAtIndex(index);
            }
        }
        
        disappearButtons()
        self.changeStateButton()

    }
    
    @IBAction func buttonClicked(sender: AnyObject){
        
        currentStatus.append((sender.subviews[1] as UILabel).text!)
        self.disappearButtons()
        self.changeStateButton()
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

    func takeTest(){
        performSegueWithIdentifier("takeTest", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        
        if segue.identifier == "takeTest"{
            var controller: TakeTestViewController = segue.destinationViewController as TakeTestViewController
            controller.sectionInfo = currentStatus
        }
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

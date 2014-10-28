
//
//  Scroller.swift
//  NEWSATHacker
//
//  Created by Kedan Li on 14/10/25.
//  Copyright (c) 2014年 Kedan Li. All rights reserved.
//

import UIKit

class Scroller: UIView, UIScrollViewDelegate, UIGestureRecognizerDelegate{

    var currentView: Int!
    var views : [UIView]!
    
    init(frame: CGRect, numberOfViews: Int) {
        
    
        super.init(frame: CGRectMake(0, 0, frame.width * CGFloat(numberOfViews), frame.height))
        
        currentView = 1
        
        views = [UIView]()
        
        for var index = 0; index < numberOfViews; index++ {
         
            var aview = UIView(frame: frame)
            
            let swiper = UISwipeGestureRecognizer(target: self, action: Selector("changeBoard:"))
            swiper.delegate = self
            aview.addGestureRecognizer(swiper)
            
            let dragger = UIPanGestureRecognizer(target: self, action: Selector("moveBoard:"))
            dragger.delegate = self
            aview.addGestureRecognizer(dragger)
            
            views.append(aview)
            
        }
        
        self.setToCenter(views[0])

        self.setToRight(views[1])
        
    }
    
    func setToRight(view: UIView){
        
        view.frame = CGRectMake(self.frame.width, 75 - 32, self.frame.width, self.frame.height)
        
        var t1 = CGAffineTransformMakeScale(1 - 0.32, 1 - 0.32)
        var t2 = CGAffineTransformMakeRotation(1/6 * 3.14)
        
        view.transform = CGAffineTransformConcat(t1, t2)
        view.alpha = 0
        
        self.addSubview(view)
        
    }
    
    func setToLeft(view: UIView){
        
        view.frame = CGRectMake(-self.frame.width, 75 - 32, self.frame.width, self.frame.height)
        
        var t1 = CGAffineTransformMakeScale(1 - 0.32, 1 - 0.32)
        var t2 = CGAffineTransformMakeRotation(1/6 * -3.14)
        
        view.transform = CGAffineTransformConcat(t1, t2)
        view.alpha = 0
        
        self.addSubview(view)

    }
    
    func setToCenter(theView: UIView){
        
        theView.frame = CGRectMake(0, 75, self.frame.width, self.frame.height)
        
        var t1 = CGAffineTransformMakeScale(1, 1)
        var t2 = CGAffineTransformMakeRotation(0)
        
        theView.transform = CGAffineTransformConcat(t1, t2)
        theView.alpha = 1
        
        self.addSubview(theView)
        
    }
    
    func moveBoard(gesture: UIPanGestureRecognizer){
    
        var transition = gesture.translationInView(self).x

        var index = find(views, gesture.view!)
        
        if index > -1{
            
            if transition <= 0{
                
                self.views[0].alpha = (transition * 0.01)/3.2 + 1
                var t1 = CGAffineTransformMakeScale(1 + transition * 0.001, 1 + transition * 0.001)
                //var t2 = CGAffineTransformMakeTranslation(transition, -transition * 0.1)
                var t3 = CGAffineTransformMakeRotation(transition / 1920 * 3.14)
                
                self.views[0].transform = CGAffineTransformConcat(t1, t3)//CGAffineTransformConcat(t2, t3))
                
                
                self.views[1].alpha = (transition * 0.01)/3.2
                var t4 = CGAffineTransformMakeScale(1 - 0.32 - transition * 0.001, 1 - 0.32 - transition * 0.001)
                var t5 = CGAffineTransformMakeTranslation(transition, 32 + transition * 0.1)
                var t6 = CGAffineTransformMakeRotation(1/6 * 3.14 + transition / 1920 * 3.14)
                
                self.views[1].transform = CGAffineTransformConcat(t4, t6)//CGAffineTransformConcat(t5, t6))
                
            }else{
                
                UIView.animateWithDuration(0.5, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                    
                    self.setToCenter(self.views[index!])
                    //self.setToLeft(self.views[index! - 1])
                    

                    }
                    , completion: {
                        (value: Bool) in
                        
                        
                        
                })
                
            }
        }
    }

    
    
    func changeBoard(gesture: UISwipeGestureRecognizer){
        
        var theViewNum: Int = find(views, gesture.view!)!
        
        if gesture.direction == UISwipeGestureRecognizerDirection.Right{
            UIView.animateWithDuration(0.8, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                self.views[theViewNum].alpha = 0
                self.views[theViewNum].center = CGPointMake(self.views[theViewNum].center.x - self.frame.width, self.views[theViewNum].center.y)
                
                self.views[theViewNum].center = CGPointMake(self.views[theViewNum].center.x - self.frame.width, self.views[theViewNum].center.y)
                
                               
                }
                , completion: {
                    (value: Bool) in
                    
            })
        }
        


        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}

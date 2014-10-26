
//
//  Scroller.swift
//  NEWSATHacker
//
//  Created by Kedan Li on 14/10/25.
//  Copyright (c) 2014年 Kedan Li. All rights reserved.
//

import UIKit

class Scroller: UIScrollView, UIScrollViewDelegate, UIGestureRecognizerDelegate{

    var currentView: Int!
    var views : [UIView]!
    
    init(frame: CGRect, numberOfViews: Int) {
        
        super.init(frame: frame)
        
        views = [UIView]()
        
        for var index = 0; index < numberOfViews; index++ {
         
            var aview = UIView(frame: frame)
            aview.frame = CGRectMake(frame.origin.x + CGFloat(index) * frame.width, frame.origin.y, frame.width, frame.height)
            
            let swiper = UISwipeGestureRecognizer(target: self, action: Selector("changeBoard:"))
            swiper.delegate = self
            aview.addGestureRecognizer(swiper)
            self.addSubview(aview)

            self.delegate = self
            
            views.append(aview)
            
        }
        
        self.contentSize = CGSizeMake(frame.width * CGFloat(numberOfViews), frame.height)
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        self.views[0].alpha = (3.2 - scrollView.contentOffset.x * 0.01)/3.2
        
        self.views[0].center = CGPointMake(self.views[0].center.x, self.views[0].center.y + self.contentOffset.x * 0.1)
        
        var t1 = CGAffineTransformMakeScale(1 - self.contentOffset.x * 0.01, 1 - self.contentOffset.x * 0.01)
        var t2 = CGAffineTransformMake(0.0, self.contentOffset.x * -0.01, self.contentOffset.x * -0.01, 0.0, self.frame.height, self.frame.width)
        //var t2 = CGAffineTransformma(self.contentOffset.x/960 * -3.14)
        //var t3 = CGAffineTransformMakeTranslation(0, self.contentOffset.x * 3)

        
        
        self.views[0].transform = CGAffineTransformConcat(t1, t2)
        
        
    }

    
    func changeBoard(gesture: UISwipeGestureRecognizer){
        
        var theViewNum: Int = find(views, gesture.view!)!
        
        if gesture.direction == UISwipeGestureRecognizerDirection.Right{
            UIView.animateWithDuration(0.8, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                self.views[theViewNum].alpha = 0
                self.views[theViewNum].center = CGPointMake(self.views[theViewNum].center.x - self.frame.width, self.views[theViewNum].center.y)
                
                self.views[theViewNum].center = CGPointMake(self.views[theViewNum].center.x - self.frame.width, self.views[theViewNum].center.y)
                
                self.views[theViewNum].transform = CGAffineTransformMakeScale(1 - self.contentOffset.x * 0.1, 1 - self.contentOffset.x * 0.1)
                self.views[theViewNum].transform = CGAffineTransformMakeRotation(self.contentOffset.x)
                
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

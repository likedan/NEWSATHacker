
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
            
            views.append(aview)
            
        }
        
        self.contentSize = CGSizeMake(frame.width * CGFloat(numberOfViews), frame.height)
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
    }

    func changeBoard(gesture: UISwipeGestureRecognizer){
        
        find(views, gesture.view!)
        
        /*
        UIView.animateWithDuration(0.8, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
            self.subjectBoard.alpha = 0
            self.subjectBoard.frame = CGRectMake(self.subjectBoard.frame.origin.x - 100, self.subjectBoard.frame.origin.y, self.subjectBoard.frame.width - 50, self.subjectBoard.frame.height - 50);
            
            self.math.frame = CGRectMake(20, 20, 20, 20)
            
            }
            , completion: {
                (value: Bool) in
                
        })*/

        
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

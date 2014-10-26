//
//  ViewController.swift
//  NEWSATHacker
//
//  Created by Kedan Li on 14-9-25.
//  Copyright (c) 2014年 Kedan Li. All rights reserved.
//lkjhlkjhkj

import UIKit
import CoreGraphics

class ViewController: UIViewController, UIGestureRecognizerDelegate{

    @IBOutlet var subjectBoard : UIScrollView!
    
    @IBOutlet var mainboard2 : UIView!


    @IBAction func mathTapped(sender : AnyObject) {
    

    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    
        self.subjectBoard.contentSize = CGSizeMake(1000, self.subjectBoard.frame.size.height)
        self.subjectBoard.scrollEnabled = true;
        self.subjectBoard.userInteractionEnabled = true;
        
        let swiper = UISwipeGestureRecognizer(target: self, action: Selector("changeBoard:"))
        swiper.delegate = self
        self.subjectBoard.addGestureRecognizer(swiper)
        
        self.mainboard2.transform = CGAffineTransformMakeScale(0.8, 0.8)
        /*
        UIView.animateWithDuration(2.0) {
            self.subjectBoard.transform = CGAffineTransformMakeScale(0.8, 0.8)
            self.subjectBoard.center = CGPointMake(self.subjectBoard.center.x - 200, self.subjectBoard.center.y)
            self.subjectBoard.alpha = 0;
        }*/
    }
    
    func changeBoard(gesture: UISwipeGestureRecognizer){
        
        UIView.animateWithDuration(0.8, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
            self.subjectBoard.alpha = 0
            self.subjectBoard.frame = CGRectMake(self.subjectBoard.frame.origin.x - 100, self.subjectBoard.frame.origin.y, self.subjectBoard.frame.width - 50, self.subjectBoard.frame.height - 50);
            
            self.math.frame = CGRectMake(20, 20, 20, 20)
            
            }
            , completion: {
                (value: Bool) in
                
        })
        
    }
    
    
    override func animationDidStop(anim: CAAnimation!, finished flag: Bool) {
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        self.mainboard.alpha = 1 - scrollView.contentOffset.x * 0.005
        self.mainboard.transform = CGAffineTransformMakeScale(1 - scrollView.contentOffset.x * 0.001, 1 - scrollView.contentOffset.x * 0.001)
        
        if(scrollView.contentOffset.x < 200){
        self.mainboard2.alpha = scrollView.contentOffset.x * 0.005
        self.mainboard2.transform = CGAffineTransformMakeScale(0.8 + scrollView.contentOffset.x * 0.001, 0.8 + scrollView.contentOffset.x * 0.001)
        }
        
        //self.math = CGRectMake(10, 10, 10, 10)//CGRectMake(108 + 0.5 * scrollView.contentOffset.x, 14 + 0.5 * scrollView.contentOffset.x, 353 - scrollView.contentOffset.x, 237 - scrollView.contentOffset.x)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func animationFunction(var x1: Int){
        
        UIView.animateWithDuration(0.5, delay: 0.3, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
            self.subjectBoard.alpha = 0.3 + self.subjectBoard.alpha
            self.subjectBoard.frame = CGRectMake(90, 90, 109, 99);
            
            }
            , completion: {
                (value: Bool) in
                
                x1--
                
                if(x1 > 0){
                    self.animationFunction(x1)
                }
                
        })
        
    }

}
//UIView.transitionWithView(self.subjectBoard, duration: 0.5, options:UIViewAnimationOptions.TransitionFlipFromLeft, animations: { _ in }, completion: nil)

//UIView.transitionFromView(self.subjectBoard, toView: self.math, duration: 4, options: UIViewAnimationOptions.TransitionFlipFromLeft, completion: nil)
/*UIView.animateWithDuration(0.5, delay: 0.3, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
self.subjectBoard.frame.size = CGSizeMake(100, 100);

}
, completion: {
(value: Bool) in

})*/



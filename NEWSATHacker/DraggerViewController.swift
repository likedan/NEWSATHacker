//
//  DraggerViewController.swift
//  NEWSATHacker
//
//  Created by Kedan Li on 14/11/3.
//  Copyright (c) 2014年 Kedan Li. All rights reserved.
//

import UIKit

class DraggerViewController: UIViewController, UIScrollViewDelegate{

    @IBOutlet var dragBoard : UIScrollView!
    @IBOutlet var numbersBoard : UIScrollView!

    @IBOutlet var backOfContent : UIView!

    
    var parentView: TakeTestViewController!
    
    var labels = [UILabel]()
    
    var totalHeight: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        
        parentView = self.parentViewController as TakeTestViewController

        totalHeight = parentView.views[parentView.views.count - 1].frame.origin.y + parentView.views[parentView.views.count - 1].frame.height
        
        for var index = 0; index < parentView.views.count; index++ {
            
            var aLab = UILabel(frame: CGRectMake(60 + CGFloat(index) * 60, 0, 60, 60))
            aLab.text = "\(index + 1)"
            aLab.textAlignment = NSTextAlignment.Center
            aLab.textColor = UIColor.whiteColor()
            aLab.font = UIFont(name: "AvenirNext-Medium", size: 40)
            aLab.userInteractionEnabled = true
            numbersBoard.addSubview(aLab)
            labels.append(aLab)
            
        }
        
        numbersBoard.contentSize = CGSizeMake(CGFloat(parentView.views.count + 1) * 60, 60)
        
        dragBoard.contentSize = CGSizeMake(totalHeight, 60)
        
        backOfContent = UIView(frame: CGRectMake(0, 0, totalHeight, 60))
        backOfContent.userInteractionEnabled = false
        backOfContent.backgroundColor = UIColor.clearColor()
        dragBoard.addSubview(backOfContent)
        
        var tapper = UITapGestureRecognizer(target: self, action: "tapped:")
        self.dragBoard.addGestureRecognizer(tapper)

    }
    
    @IBAction func tapped(recognizer : UITapGestureRecognizer) {
        
        var point = recognizer.locationInView(numbersBoard)
        
        var currentQuestion: Int = Int(point.x / 60) - 1
        
        if currentQuestion < 0{
            currentQuestion = 0
        }else if currentQuestion >= parentView.views.count{
            currentQuestion = parentView.views.count - 1
        }
        
        if parentView.scrollViewInControl == "dragger"{
        
            self.dragBoard.setContentOffset(CGPointMake(parentView.views[currentQuestion].frame.origin.y, 0), animated: true)
        
        }else if parentView.scrollViewInControl == "content"{
            
            (self.parentView.childViewControllers[0] as ContentViewController).contentBoard.setContentOffset(CGPointMake((self.parentView.childViewControllers[0] as ContentViewController).contentBoard.contentOffset.x, parentView.views[currentQuestion].frame.origin.y * (self.parentView.childViewControllers[0] as ContentViewController).contentBoard.zoomScale), animated: true)
        }
        
    }

    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return backOfContent
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        parentView.scrollViewInControl = "dragger"
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {

        if parentView.scrollViewInControl == "dragger"{
            if scrollView == dragBoard{
                
                rescaleScrollViewOffset()
                
            }
            println(self.numbersBoard.contentOffset.x)
            println((self.parentView.childViewControllers[0] as ContentViewController).contentBoard.contentOffset.y)

        }
    }
    
    func rescaleScrollViewOffset(){
        self.numbersBoard.contentOffset = CGPointMake(calculateNumberOffset(self.dragBoard.contentOffset.x), 0)
        (self.parentView.childViewControllers[0] as ContentViewController).contentBoard.contentOffset = CGPointMake((self.parentView.childViewControllers[0] as ContentViewController).contentBoard.contentOffset.x, self.dragBoard.contentOffset.x * (self.parentView.childViewControllers[0] as ContentViewController).contentBoard.zoomScale)
    }
    
    //user approximation to calculate offset
    func calculateNumberOffset(x: CGFloat)->CGFloat{
        
        
        var approximate: Int = Int(x / totalHeight * CGFloat(parentView.views.count))
        if approximate < 0{
            approximate = 0
        }else if approximate >= parentView.views.count{
            approximate = parentView.views.count - 1
        }
        
        while parentView.views[approximate].frame.origin.y > x{
            approximate--
            if approximate < 0{
                approximate = 0
                break
            }
        }
        while parentView.views[approximate].frame.origin.y + parentView.views[approximate].frame.height < x{
            approximate++
            if approximate >= parentView.views.count{
                approximate = parentView.views.count - 1
                break
            }
        }
        println(approximate)
        
        return CGFloat(approximate * 60) + (x - parentView.views[approximate].frame.origin.y) / parentView.views[approximate].frame.height * 60
    }
    
    func toLandscape(){
        for item in labels{
            item.transform = CGAffineTransformMakeRotation(-3.14 / 2)
        }
    }
    func toPortrait(){
        for item in labels{
            item.transform = CGAffineTransformMakeRotation(0)
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

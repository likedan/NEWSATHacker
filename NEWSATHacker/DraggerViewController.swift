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
    
    var parentView: TakeTestViewController!
    
    var labels = [UIView]()
    
    var totalHeight: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        
        parentView = self.parentViewController as TakeTestViewController

        totalHeight = parentView.views[parentView.views.count - 1].frame.origin.y + parentView.views[parentView.views.count - 1].frame.height
        
        for var index = 0; index < parentView.views.count; index++ {
            
            var view = UIView(frame: CGRectMake(60 + CGFloat(index) * 60, 0, 60, 60))
            view.userInteractionEnabled = true
            
            var aLab = UILabel(frame: CGRectMake(0, 0, 60, 60))
            aLab.text = "\(index + 1)"
            aLab.textAlignment = NSTextAlignment.Center
            aLab.textColor = UIColor.whiteColor()
            aLab.font = UIFont(name: "AvenirNext-Medium", size: 20)
            aLab.userInteractionEnabled = false
            view.addSubview(aLab)
            
            aLab = UILabel(frame: CGRectMake(40, 20, 20, 20))
            aLab.text = ""
            aLab.textAlignment = NSTextAlignment.Center
            aLab.textColor = UIColor.whiteColor()
            aLab.font = UIFont(name: "AvenirNext-Medium", size: 18)
            aLab.userInteractionEnabled = false
            view.addSubview(aLab)
            
            numbersBoard.addSubview(view)
            labels.append(view)
            
        }
        numbersBoard.contentSize = CGSizeMake(CGFloat(parentView.views.count + 1) * 60, 60)
        numbersBoard.contentOffset = CGPointMake(0, 15)
        
        dragBoard.contentSize = CGSizeMake(totalHeight, 30)
        
        var tapper = UITapGestureRecognizer(target: self, action: "tapped:")
        self.dragBoard.addGestureRecognizer(tapper)

        (labels[parentView.currentQuestion].subviews[0] as UILabel).textColor = UIColor(red: 226.0/255.0, green: 220.0/255.0, blue: 227.0/255.0, alpha: 1)

    }
    
    @IBAction func tapped(recognizer : UITapGestureRecognizer) {
        
        
        var point = recognizer.locationInView(numbersBoard)
        
        var currentQuestion: Int = Int(point.x / 60) - 1
        
        if currentQuestion < 0{
            currentQuestion = 0
        }else if currentQuestion >= parentView.views.count{
            currentQuestion = parentView.views.count - 1
        }

        (labels[parentView.currentQuestion].subviews[0] as UILabel).textColor = UIColor.whiteColor()
        
        self.moveToCertainQuestion(parentView.currentQuestion, toquestion: currentQuestion)
        
    }
    
    func moveToCertainQuestion(fromquestion: Int, toquestion: Int){
        
        parentView.currentQuestion = toquestion
        
        (labels[fromquestion].subviews[0] as UILabel).textColor = UIColor.whiteColor()
        
        (labels[toquestion].subviews[0] as UILabel).textColor = UIColor(red: 226.0/255.0, green: 220.0/255.0, blue: 227.0/255.0, alpha: 1)

        if parentView.scrollViewInControl == "dragger"{
            
            self.dragBoard.setContentOffset(CGPointMake(parentView.views[toquestion].frame.origin.y - 30, 0), animated: true)
            
        }else if parentView.scrollViewInControl == "content"{
            
            (self.parentView.childViewControllers[0] as ContentViewController).contentBoard.setContentOffset(CGPointMake((self.parentView.childViewControllers[0] as ContentViewController).contentBoard.contentOffset.x, (parentView.views[toquestion].frame.origin.y - 30) * (self.parentView.childViewControllers[0] as ContentViewController).contentBoard.zoomScale), animated: true)
        }
        
    }

    func choiceChosen(answer: String, question: Int){
        
        
        // make changes when first time an answer is chosen

        if (labels[question].subviews[1] as UILabel).text == ""{
            
            parentView.answeredQuestion++
            if interfaceOrientation.isLandscape{
                (labels[question].subviews[0] as UILabel).frame = CGRectMake(0, 0, 45, 45)
                (labels[question].subviews[0] as UILabel).font = UIFont(name: "AvenirNext-Medium", size: 33)
            }
            
        }

        if interfaceOrientation.isLandscape{
            parentView.switchMenuAndCompletion()
        }else{
            parentView.completionSpin()
        }
        (labels[question].subviews[1] as UILabel).text = answer

        if (labels[question + 1].subviews[1] as UILabel).text == ""{
            
            if question < labels.count - 1{
                moveToCertainQuestion(question, toquestion: question + 1)
                
            }
        }
        
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        parentView.scrollViewInControl = "dragger"
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {

        if parentView.scrollViewInControl == "dragger"{
            if scrollView == dragBoard{
                
                rescaleScrollViewOffset()
                
            }
        }
    }
    
    func rescaleScrollViewOffset(){
        self.numbersBoard.contentOffset = CGPointMake(calculateNumberOffset(self.dragBoard.contentOffset.x), numbersBoard.contentOffset.y)
        (self.parentView.childViewControllers[0] as ContentViewController).contentBoard.contentOffset = CGPointMake((self.parentView.childViewControllers[0] as ContentViewController).contentBoard.contentOffset.x, self.dragBoard.contentOffset.x * (self.parentView.childViewControllers[0] as ContentViewController).contentBoard.zoomScale)
    }
    
    //user approximation to calculate offset
    func calculateNumberOffset(x: CGFloat)->CGFloat{
        
       var approximate = getCurrentQuestion(x)
        return CGFloat(approximate * 60) + (x - parentView.views[approximate].frame.origin.y) / parentView.views[approximate].frame.height * 60
    }
    
    func findUppestQuestion(){
        
        for var index = 0; index < labels.count; index++ {
            
            if (labels[index].subviews[1] as UILabel).text == ""{
            
                moveToCertainQuestion(parentView.currentQuestion, toquestion: index)
                break
                
            }
        }
        
    }
    
    func getCurrentQuestion(index: CGFloat)->Int{
        
        var approximate: Int = Int(index / totalHeight * CGFloat(parentView.views.count))
        if approximate < 0{
            approximate = 0
        }else if approximate >= parentView.views.count{
            approximate = parentView.views.count - 1
        }
        
        while parentView.views[approximate].frame.origin.y > index{
            approximate--
            if approximate < 0{
                approximate = 0
                break
            }
        }
        while parentView.views[approximate].frame.origin.y + parentView.views[approximate].frame.height < index{
            approximate++
            if approximate >= parentView.views.count{
                approximate = parentView.views.count - 1
                break
            }
        }
        
        return approximate
    }
    
    
    
    func toLandscape(){
        for item in labels{
            item.transform = CGAffineTransformMakeRotation(-3.14 / 2)
            if (item.subviews[1] as UILabel).text == ""{
                (item.subviews[0] as UILabel).font = UIFont(name: "AvenirNext-Medium", size: 40)
            }else{
                (item.subviews[0] as UILabel).frame = CGRectMake(0, 0, 45, 45)
                (item.subviews[0] as UILabel).font = UIFont(name: "AvenirNext-Medium", size: 33)
            }
            (item.subviews[1] as UILabel).frame = CGRectMake(40, 40, 20, 20)
        }
    }
    func toPortrait(){
        for item in labels{
            item.transform = CGAffineTransformMakeRotation(0)
            dragBoard.contentOffset.y = 15
            if (item.subviews[1] as UILabel).text != ""{
                (item.subviews[0] as UILabel).frame = CGRectMake(0, 0, 60, 60)
            }

            (item.subviews[0] as UILabel).font = UIFont(name: "AvenirNext-Medium", size: 20)
            (item.subviews[1] as UILabel).frame = CGRectMake(40, 20, 20, 20)
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

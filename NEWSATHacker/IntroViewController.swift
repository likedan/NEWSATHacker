
//
//  IntroViewController.swift
//  NEWSATHacker
//
//  Created by Kedan Li on 14/12/4.
//  Copyright (c) 2014年 Kedan Li. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate{
    
    @IBOutlet var scroller: UIScrollView!
    
    @IBOutlet var back: UIView!
    
    @IBOutlet var controller: UIPageControl!
    
    @IBOutlet var firstView: first!
    @IBOutlet var secondView: second!
    @IBOutlet var fourthView: fourth!
    @IBOutlet var thirdView: third!
    
    
    var currentPageNum = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scroller.contentSize = CGSizeMake(1280, 568)
        scroller.showsHorizontalScrollIndicator = false
        
        var gestureReco = UIPanGestureRecognizer(target: self, action: "dragged:")
        back.addGestureRecognizer(gestureReco)
        
        firstView = NSBundle.mainBundle().loadNibNamed("1View", owner: self, options: nil)[0] as first
        scroller.addSubview(firstView)
        
        secondView = NSBundle.mainBundle().loadNibNamed("2View", owner: self, options: nil)[0] as second
        secondView.center.x = secondView.center.x + 320
        scroller.addSubview(secondView)
        secondView.toInitialState()
        
        thirdView = NSBundle.mainBundle().loadNibNamed("3View", owner: self, options: nil)[0] as third
        thirdView.center.x = thirdView.center.x + 640
        scroller.addSubview(thirdView)
        
        fourthView = NSBundle.mainBundle().loadNibNamed("4View", owner: self, options: nil)[0] as fourth
        fourthView.center.x = fourthView.center.x + 960
        scroller.addSubview(fourthView)
        
        fourthView.year1 = UIButton(frame: CGRectMake(320, 80, 260, 90))
        var angle = CGAffineTransformMakeRotation(0.242);
        
        var line = UIImageView(frame: CGRectMake(-0, 40, 290, 4))
        line.backgroundColor = UIColor.whiteColor()
        line.transform = angle
        fourthView.year1.addSubview(line)
        
        var label = UILabel(frame: CGRectMake(-60, -40, 304, 110))
        label.text = "2014"
        label.font = UIFont(name: "AvenirNext-Medium", size: 32)
        label.textAlignment = NSTextAlignment.Right
        label.textColor = UIColor.whiteColor()
        label.transform = angle
        fourthView.year1.addSubview(label)
        fourthView.addSubview(fourthView.year1)
        
        fourthView.year2 = UIButton(frame: CGRectMake(320, 170, 260, 90))
        line = UIImageView(frame: CGRectMake(-0, 40, 290, 4))
        line.backgroundColor = UIColor.whiteColor()
        line.transform = angle
        fourthView.year2.addSubview(line)
        label = UILabel(frame: CGRectMake(-60, -40, 304, 110))
        label.text = "2013"
        label.font = UIFont(name: "AvenirNext-Medium", size: 32)
        label.textAlignment = NSTextAlignment.Right
        label.textColor = UIColor.whiteColor()
        label.transform = angle
        fourthView.year2.addSubview(label)
        fourthView.addSubview(fourthView.year2)
        
        fourthView.year3 = UIButton(frame: CGRectMake(320, 260, 260, 90))
        line = UIImageView(frame: CGRectMake(-0, 40, 290, 4))
        line.backgroundColor = UIColor.whiteColor()
        line.transform = angle
        fourthView.year3.addSubview(line)
        label = UILabel(frame: CGRectMake(-60, -40, 304, 110))
        label.text = "2012"
        label.font = UIFont(name: "AvenirNext-Medium", size: 32)
        label.textAlignment = NSTextAlignment.Right
        label.textColor = UIColor.whiteColor()
        label.transform = angle
        fourthView.year3.addSubview(label)
        fourthView.addSubview(fourthView.year3)
        
        fourthView.year4 = UIButton(frame: CGRectMake(320, 350, 260, 90))
        line = UIImageView(frame: CGRectMake(-0, 40, 290, 4))
        line.backgroundColor = UIColor.whiteColor()
        line.transform = angle
        fourthView.year4.addSubview(line)
        label = UILabel(frame: CGRectMake(-60, -40, 304, 110))
        label.text = "2011"
        label.font = UIFont(name: "AvenirNext-Medium", size: 32)
        label.textAlignment = NSTextAlignment.Right
        label.textColor = UIColor.whiteColor()
        label.transform = angle
        fourthView.year4.addSubview(label)
        fourthView.addSubview(fourthView.year4)
        
        fourthView.beginBut.addTarget(self.parentViewController, action: "hideIntro", forControlEvents: UIControlEvents.TouchUpInside)
        
        // Do any additional setup after loading the view, typically from a nib.
        firstView.userInteractionEnabled = false
        secondView.userInteractionEnabled = false
        thirdView.userInteractionEnabled = false
    }
    
    override func viewDidAppear(animated: Bool) {
        
    }
    
    @IBAction func dragged(recognizer : UIPanGestureRecognizer) {
        
        let translation = recognizer.translationInView(self.view)
        scroller.setContentOffset(CGPointMake(320 * CGFloat(currentPageNum) - translation.x, 0), animated: false)
        
        if recognizer.state == UIGestureRecognizerState.Cancelled || recognizer.state == UIGestureRecognizerState.Failed || recognizer.state == UIGestureRecognizerState.Ended{
            determineCurrentPage()
        }
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        var index = scroller.contentOffset.x
        
        if index >= 0 && index < 320{
            firstView.moveEverythingAccordingToIndex(index)
        }
        if index >= 0 && index < 640{
            secondView.moveEverythingAccordingToIndex(index)
        }else if index < 0{
            secondView.toInitialState()
        }
        if index >= 320 && index < 960{
            thirdView.moveEverythingAccordingToIndex(index - 320)
        }
        if index >= 640 && index < 1280{
            fourthView.moveEverythingAccordingToIndex(index - 640)
            
            println(fourthView.begin.frame)
        }
        if index >= 1280{
            fourthView.begin.center = CGPointMake(160, 450)
            self.view.addSubview(fourthView.begin)
        }
        
        
    }
    
    func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    }
    
    func determineCurrentPage(){
        if scroller.contentOffset.x > 160 + 320 * CGFloat(currentPageNum) && currentPageNum < 4{
            currentPageNum++
        }else if scroller.contentOffset.x < 320 * CGFloat(currentPageNum - 1) + 160 && currentPageNum > 0{
            currentPageNum--
        }
        controller.currentPage = currentPageNum
        scroller.setContentOffset(CGPointMake(320 * CGFloat(currentPageNum), 0), animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}

class first: UIView{
    
    @IBOutlet var lab1: UILabel!
    @IBOutlet var lab2: UILabel!
    @IBOutlet var lab3: UILabel!
    @IBOutlet var lab4: UILabel!
    @IBOutlet var lab5: UILabel!
    @IBOutlet var lab6: UILabel!
    
    @IBOutlet var icon: UIImageView!
    
    @IBOutlet var iconBack: UIImageView!
    @IBOutlet var iconFront: UIImageView!
    
    func moveEverythingAccordingToIndex(index: CGFloat){
        
        var stay = CGAffineTransformMakeTranslation(index, 0)
        var up = CGAffineTransformMakeTranslation(index, -index / 3)
        var down = CGAffineTransformMakeTranslation(index, index / 3)
        var speed1 = CGAffineTransformMakeTranslation(-index / 5, -index / 5)
        var speed2 = CGAffineTransformMakeTranslation(index / 4, -index / 10)
        var speed3 = CGAffineTransformMakeTranslation(-index / 5, 0)
        var speed4 = CGAffineTransformMakeTranslation(index / 4, index / 10)
        var speed5 = CGAffineTransformMakeTranslation(-index / 5, index / 5)
        var enlarge = CGAffineTransformMake(1 + index / 20, 0, 0, 1 + index / 20, index, 0)
        
        lab1.transform = down
        lab1.alpha = (200 - index) / 200
        
        icon.transform = up
        icon.alpha = (200 - index) / 200
        
        lab2.transform = speed1
        
        lab3.transform = speed2
        
        lab4.transform = speed3
        
        lab5.transform = speed4
        
        lab6.transform = speed5
        
        if index < 250{
            iconBack.transform = enlarge
            iconBack.alpha = 1
        }else{
            iconBack.alpha = 0
        }
        
    }
    
}

class second: UIView{
    
    //0 - 640
    
    @IBOutlet var words: UIView!
    @IBOutlet var redo1: UILabel!
    @IBOutlet var redo2: UILabel!
    @IBOutlet var board: UIView!
    
    @IBOutlet var choice1: UIImageView!
    @IBOutlet var choice2: UIImageView!
    @IBOutlet var choice3: UIImageView!
    @IBOutlet var choice4: UIImageView!
    @IBOutlet var choice5: UIImageView!
    @IBOutlet var choice6: UIImageView!
    @IBOutlet var choice7: UIImageView!
    @IBOutlet var choice8: UIImageView!
    @IBOutlet var choice9: UIImageView!
    
    func toInitialState(){
        
        self.backgroundColor = UIColor.clearColor()
        
        var enlarge = CGAffineTransformMake(20, 0, 0, 20, 0, 0)
        
        redo1.alpha = 0
        redo2.alpha = 0
        
        redo1.transform = enlarge
        redo2.transform = enlarge
        
        choice1.alpha = 0
        choice2.alpha = 0
        choice3.alpha = 0
        choice4.alpha = 0
        choice5.alpha = 0
        choice6.alpha = 0
        choice7.alpha = 0
        choice8.alpha = 0
        choice9.alpha = 0
        
        words.alpha = 0
        
        var shrinkBoard = CGAffineTransformMake(1 / 640, 0, 0, 1 / 640, -320, board.frame.height)
        board.transform = shrinkBoard
    }
    
    func moveEverythingAccordingToIndex(index: CGFloat){
        
        
        
        if index < 160{
            var enlarge = CGAffineTransformMake(4 * index / 640, 0, 0, 4 * index / 640, -320 + index, board.frame.height - index * board.frame.height / 160)
            board.transform = enlarge
        }else if index >= 160 && index <= 320{
            var enlarge = CGAffineTransformMake(1, 0, 0, 1, -320 + index, 0)
            board.transform = enlarge
        }else if index > 320 && index < 480{
            var turnLeft = CGAffineTransformMakeRotation((index - 320) * 3.14 / 320)
            board.transform = turnLeft
        }else if index >= 480{
            var turnLeft = CGAffineTransformMakeRotation(3.14 / 2)
            board.transform = turnLeft
        }
        
        
        if index > 160{
            choice1.alpha = (index - 160) / 10
            choice2.alpha = (index - 170) / 10
            choice3.alpha = (index - 180) / 10
            choice4.alpha = (index - 190) / 10
            choice5.alpha = (index - 200) / 10
            choice6.alpha = (index - 210) / 10
            choice7.alpha = (index - 220) / 10
            choice8.alpha = (index - 230) / 10
            choice9.alpha = (index - 240) / 10
        }else{
            choice1.alpha = 0
            choice2.alpha = 0
            choice3.alpha = 0
            choice4.alpha = 0
            choice5.alpha = 0
            choice6.alpha = 0
            choice7.alpha = 0
            choice8.alpha = 0
            choice9.alpha = 0
        }
        
        if index <= 230{
            redo1.alpha = 0
        } else if index > 230 && index < 270{
            var shrink = CGAffineTransformMake((271 - index) / 2, 0, 0, (271 - index) / 2, 0, 0)
            redo1.alpha = (index - 230) / 40
            redo1.transform = shrink
        } else if index >= 270 && index <= 320 {
            redo1.alpha = 1
            var shrink = CGAffineTransformMake(1, 0, 0, 1, 0, 0)
            redo1.transform = shrink
        }
        
        var speed1 = CGAffineTransformMakeTranslation(-(index - 320)/4, 0)
        var speed2 = CGAffineTransformMakeTranslation((index - 320)/4, 0)
        
        if index <= 260 {
            redo2.alpha = 0
        } else if index > 260 && index < 300{
            var shrink = CGAffineTransformMake((301 - index) / 2, 0, 0, (301 - index) / 2, 0, 0)
            redo2.alpha = (index - 260) / 40
            redo2.transform = shrink
        }else if index >= 300 && index <= 320 {
            redo2.alpha = 1
            var shrink = CGAffineTransformMake(1, 0, 0, 1, 0, 0)
            redo2.transform = shrink
        }else if index > 320{
            redo2.transform = speed1
        }
        
        if index < 320{
            words.alpha = index / 320
        }else{
            words.alpha =  1 - (index - 320) / 320
            words.transform = speed2
        }
        if index <= 231{
            self.superview?.backgroundColor = UIColor.clearColor()
        }else if index > 231 && index < 320{
            self.superview?.backgroundColor = UIColor(red: 32.0/255, green: 176.0/255, blue: 140.0/255, alpha: 1)
            
        }
        
    }
    
}

class third: UIView{
    
    @IBOutlet var lab1: UILabel!
    
    @IBOutlet var vertical: UIImageView!
    @IBOutlet var horizontal: UIImageView!
    
    @IBOutlet var portrait: UILabel!
    @IBOutlet var landscape: UILabel!
    
    func toInitialState(){
        
        self.backgroundColor = UIColor.clearColor()
        
    }
    
    //0 - 640
    func moveEverythingAccordingToIndex(index: CGFloat){
        
        var stay = CGAffineTransformMakeTranslation(index, 0)
        var turn = CGAffineTransformMake(1 - (index - 250) / 70, (index - 250) / 70 - (index - 250) / 210, -(index - 250) / 70 + (index - 250) / 210, 1 - (index - 250) / 70, (index - 250), (index - 250) * 2.0)
        var transform = CGAffineTransformMake(1 - (index - 250) / 210, 0, 0, 1 - (index - 250) / 210, -(index - 250) / 2, -(index - 250) / 3)
        
        var enlarge = CGAffineTransformMake(1 + index / 20, 0, 0, 1 + index / 20, index, 0)
        
        if index < 100{
            self.superview?.backgroundColor = UIColor(red: 32.0/255, green: 176.0/255, blue: 140.0/255, alpha: 1)
        }else if index > 100 && index < 200{
            self.superview?.backgroundColor = UIColor(red: (32.0 + (index - 100) * 1.11)/255, green: (176.0 + (index - 100) * 0.29)/255, blue: (140.0 + (index - 100) * 0.67)/255, alpha: 1)
        }else if index >= 200{
            self.superview?.backgroundColor = UIColor(red: 143.0/255, green: 205.0/255, blue: 232.0/255, alpha: 1)
        }
        
        if index < 200{
            vertical.alpha = 0
            horizontal.alpha = 1
            vertical.transform = CGAffineTransformMake(1, 0, 0, 1, 0, 0)
            horizontal.transform = CGAffineTransformMake(1, 0, 0, 1, 0, 0)
        }else if index > 250 && index <= 320 {
            vertical.transform = turn
            vertical.alpha = (index - 250) / 70
            horizontal.transform = transform
            portrait.alpha = (index - 250) / 70
            landscape.alpha = (index - 250) / 70
            
        }else if index > 320{
            vertical.transform = CGAffineTransformMake(0, 0.6777777, -0.6777777, 0, 70, 140 + -(index - 320) * (index - 320) / 30)
            horizontal.transform = CGAffineTransformMake(0.6777777, 0, 0, 0.6777777, -35, -23.333 + (index - 320) * (index - 320) / 20)
            
            vertical.alpha =  1 - (index - 320) / 100
            horizontal.alpha = 1 - (index - 320) / 100
            portrait.alpha = 1 - (index - 320) / 100
            landscape.alpha = 1 - (index - 320) / 100
        }
        
        if index <= 280{
            lab1.transform = CGAffineTransformMake(1, 0, 0, 1, 0, 0)
            lab1.alpha = 1
        }else if index > 280 && index < 320{
            lab1.transform = CGAffineTransformMake(1 + (index - 280) / 100, 0, 0, 1 + (index - 280) / 100, 0, index - 280)
            lab1.alpha = 1
        }else if index >= 320 {
            lab1.transform = CGAffineTransformMake(1.4 - (index - 320) / 70, 0, 0, 1.4 - (index - 320) / 70, -(index - 320) * 3, 40 + (index - 320) * (index - 320) / 20)
            lab1.alpha = (420 - index) / 100
        }
        
        println(index)
        
    }
    
}


class fourth: UIView{
    
    @IBOutlet var lab1: UILabel!
    @IBOutlet var lab2: UILabel!
    @IBOutlet var lab3: UILabel!
    
    @IBOutlet var year: UILabel!
    
    @IBOutlet var year1: UIButton!
    @IBOutlet var year2: UIButton!
    @IBOutlet var year3: UIButton!
    @IBOutlet var year4: UIButton!
    
    @IBOutlet var begin: UIView!
    @IBOutlet var beginBut: UIButton!
    @IBOutlet var logo: UIButton!
    
    
    @IBOutlet var slideBoard: UIView!
    
    func toInitialState(){
        
        self.backgroundColor = UIColor.clearColor()
        var enlarge = CGAffineTransformMake(20, 0, 0, 20, 0, 0)
        
    }
    
    //0 - 640
    func moveEverythingAccordingToIndex(index: CGFloat){
        
        var stay = CGAffineTransformMakeTranslation(index, 0)
        var up = CGAffineTransformMakeTranslation(index, -index / 3)
        var speed1 = CGAffineTransformMakeTranslation(-index/5, 0)
        var speed2 = CGAffineTransformMakeTranslation(index/4, 0)
        var enlarge = CGAffineTransformMake(1 + index / 20, 0, 0, 1 + index / 20, index, 0)
        
        if index < 600{
            self.superview?.backgroundColor = UIColor(red: 143.0/255, green: 205.0/255, blue: 232.0/255, alpha: 1)
        }else if index >= 600{
            self.superview?.backgroundColor = UIColor.whiteColor()
        }
        
        if index < 200{
            var slideMotion = CGAffineTransformMakeTranslation(-320 + index, 200 - index)
            slideBoard.transform = slideMotion
        }else if index >= 200 && index <= 220 {
            slideBoard.transform = CGAffineTransformMakeTranslation(-320 + index, 200 - index)
        }else if index > 220 && index < 230{
            slideBoard.transform = CGAffineTransformMakeTranslation(-320 + index, -(230 - index) * 2)
        }else if index >= 220 && index <= 320{
            slideBoard.transform = CGAffineTransformMakeTranslation(-320 + index, 0)
        }else if index > 320{
            slideBoard.transform = CGAffineTransformMakeTranslation(-320 + index, (320 - index) * 2)
        }
        
        if index < 100{
            lab1.transform = CGAffineTransformMakeTranslation(0, 200)
            lab2.transform = CGAffineTransformMakeTranslation(0, 200)
            lab3.transform = CGAffineTransformMakeTranslation(0, 200)
        }else if index >= 100 && index <= 140{
            lab1.transform = CGAffineTransformMakeTranslation(0, (140 - index) * 5)
            lab2.transform = CGAffineTransformMakeTranslation(0, 200)
            lab3.transform = CGAffineTransformMakeTranslation(0, 200)
        }else if index > 140 && index < 180{
            lab1.transform = CGAffineTransformMakeTranslation(0, 0)
            lab2.transform = CGAffineTransformMakeTranslation(0, (180 - index) * 5)
            lab3.transform = CGAffineTransformMakeTranslation(0, 200)
        }else if index >= 180 && index <= 200{
            lab1.transform = CGAffineTransformMakeTranslation(0, 0)
            lab2.transform = CGAffineTransformMakeTranslation(0, 0)
            lab3.transform = CGAffineTransformMakeTranslation(0, (200 - index) * 10)
        }else if index > 200{
            lab1.transform = CGAffineTransformMakeTranslation(0, 0)
            lab2.transform = CGAffineTransformMakeTranslation(0, 0)
            lab3.transform = CGAffineTransformMakeTranslation(0, 0)
        }
        
        if index < 220{
            year1.transform = CGAffineTransformMakeTranslation(0, 0)
            year2.transform = CGAffineTransformMakeTranslation(0, 0)
            year3.transform = CGAffineTransformMakeTranslation(0, 0)
            year4.transform = CGAffineTransformMakeTranslation(0, 0)
        }else if index >= 220 && index <= 240{
            year1.transform = CGAffineTransformMakeTranslation(-(index - 220) * 15, 0)
            year2.transform = CGAffineTransformMakeTranslation(0, 0)
            year3.transform = CGAffineTransformMakeTranslation(0, 0)
            year4.transform = CGAffineTransformMakeTranslation(0, 0)
        }else if index > 240 && index < 260{
            year1.transform = CGAffineTransformMakeTranslation(-300, 0)
            year2.transform = CGAffineTransformMakeTranslation(-(index - 240) * 15, 0)
            year3.transform = CGAffineTransformMakeTranslation(0, 0)
            year4.transform = CGAffineTransformMakeTranslation(0, 0)
        }else if index >= 260 && index <= 280{
            year1.transform = CGAffineTransformMakeTranslation(-300, 0)
            year2.transform = CGAffineTransformMakeTranslation(-300, 0)
            year3.transform = CGAffineTransformMakeTranslation(-(index - 260) * 15, 0)
            year4.transform = CGAffineTransformMakeTranslation(0, 0)
        }else if index > 280 && index < 300{
            year1.transform = CGAffineTransformMakeTranslation(-300, 0)
            year2.transform = CGAffineTransformMakeTranslation(-300, 0)
            year3.transform = CGAffineTransformMakeTranslation(-300, 0)
            year4.transform = CGAffineTransformMakeTranslation(-(index - 280) * 15, 0)
        }else if index >= 300 && index <= 320{
            year1.transform = CGAffineTransformMakeTranslation(-300 + (index - 300), 0)
            year2.transform = CGAffineTransformMakeTranslation(-300 + (index - 300), 0)
            year3.transform = CGAffineTransformMakeTranslation(-300 + (index - 300), 0)
            year4.transform = CGAffineTransformMakeTranslation(-300 + (index - 300), 0)
            
        }else if index > 320{
            year1.transform = CGAffineTransformMakeTranslation(-600 + index, (320 - index))
            year2.transform = CGAffineTransformMakeTranslation(-600 + index, (320 - index))
            year3.transform = CGAffineTransformMakeTranslation(-600 + index, (320 - index))
            year4.transform = CGAffineTransformMakeTranslation(-600 + index, (320 - index))
        }
        
        if index < 320 {
            year.transform = CGAffineTransformMakeTranslation(0, 0)
        }else if index >= 320{
            year.transform = CGAffineTransformMakeTranslation(index - 320, (320 - index))
        }
        
        if index < 400{
            logo.alpha = 0
        }else if index >= 400{
            logo.alpha = (index - 400) / 200
        }
        
        if index <= 500{
            begin.transform = CGAffineTransformMake(0, 0, 0, 0, 0, 0)
        }else if index > 500 && index < 640{
            begin.transform = CGAffineTransformMake((index - 500) / 120, 0, 0, (index - 500) / 120, 0, 0)
            self.userInteractionEnabled = false
        }else if index >= 640{
            self.userInteractionEnabled = true
        }
        
    }
    
}

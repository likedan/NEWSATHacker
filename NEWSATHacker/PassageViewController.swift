//
//  PassageViewController.swift
//  NEWSATHacker
//
//  Created by Kedan Li on 14/11/7.
//  Copyright (c) 2014年 Kedan Li. All rights reserved.
//

import UIKit

class PassageViewController: UIViewController, UIScrollViewDelegate{

    @IBOutlet var backOfContent : UIView!
    @IBOutlet var backOfDraft : SmoothLineView!
    
    @IBOutlet var contentBoard : UIScrollView!
    @IBOutlet var puller : UIView!
    @IBOutlet var pullerLine : UIView!
    @IBOutlet var pullerTop : UIView!
    
    var parentView: TakeTestViewController!
    var horizontalScrollEnabled = false

    var views = [AnyObject]()
    var indexOfEachQuestion = [CGFloat]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(animated)
        
        parentView = self.parentViewController as TakeTestViewController
        let generator: GenerateContentForTest = GenerateContentForTest()
        views = generator.generatePassage(parentView.testData)
        indexOfEachQuestion = generator.calculateIndexOfEachQuestionInReading(parentView.testData)
        
        generateContentBoard()
        
        contentBoard.pinchGestureRecognizer.enabled = false
        
        var tapper = UITapGestureRecognizer(target: self, action: "zoom:")
        tapper.numberOfTapsRequired = 2
        contentBoard.addGestureRecognizer(tapper)
        
        var gestureReco = UIPanGestureRecognizer(target: self, action: "dragged:")
        puller.addGestureRecognizer(gestureReco)

        if parentView.isLandscaped{
            toLandscape()
        }
        
        self.moveToCertainIndexForQuestion()

    }
    
    func changePassage(){
        
        UIView.animateWithDuration(0.5, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
            self.contentBoard.alpha = 0
            }
            , completion: {
                (value: Bool) in
                self.backOfContent.removeFromSuperview()
                self.backOfDraft.removeFromSuperview()
                self.backOfContent = nil
                self.backOfDraft = nil
                self.generateContentBoard()
                UIView.animateWithDuration(0.5, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                    self.contentBoard.alpha = 1
                    }
                    , completion: {
                        (value: Bool) in
                        self.moveToCertainIndexForQuestion()
                })

        })
    }
    
    func generateContentBoard(){
        
        backOfContent = UIView(frame: CGRectMake(0, 0, 440, views[parentView.currentPassage - 1][views[parentView.currentPassage - 1].count - 1].frame.height))
        backOfContent.userInteractionEnabled = false
        backOfContent.backgroundColor = UIColor.clearColor()
        println(parentView.currentPassage)
        
        
        if parentView.passageDrafts["\(parentView.currentPassage)"] == nil{
            backOfDraft = SmoothLineView(frame: backOfContent.frame)
            parentView.passageDrafts.updateValue(backOfDraft, forKey: "\(parentView.currentPassage)")
        }else{
            backOfDraft = parentView.passageDrafts["\(parentView.currentPassage)"] as SmoothLineView
        }
        backOfDraft.userInteractionEnabled = true
        
        for items in views[parentView.currentPassage - 1] as [UIView]{
            items.userInteractionEnabled = false
            backOfContent.addSubview(items)
            println(items.frame)

        }
        backOfContent.addSubview(backOfDraft)
        contentBoard.contentSize = backOfContent.frame.size
        contentBoard.addSubview(backOfContent)
        contentBoard.setZoomScale(0.73, animated: false)
        
        if parentView.switcher.selected{
            self.backOfContent.userInteractionEnabled = true
            self.contentBoard.scrollEnabled = false
        }
        
    }
    
    @IBAction func dragged(recognizer : UIPanGestureRecognizer) {
        
        let translatedPoint = recognizer.translationInView(self.view)
        
        let y = self.view.center.y + translatedPoint.y
        recognizer.setTranslation(CGPointMake(0, 0), inView: self.view)
        self.view.center = CGPointMake(self.view.center.x, y)
        
        if self.view.frame.origin.y > -30{
                        
            UIView.animateWithDuration(0.8, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                self.view.frame = CGRectMake(self.view.frame.origin.x, -30, self.view.frame.width, self.view.frame.height)
                }
                , completion: {
                    (value: Bool) in
                    
            })
        
        }else if self.view.frame.origin.y < -self.view.frame.height + 60{
            
            UIView.animateWithDuration(0.8, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                self.view.frame = CGRectMake(self.view.frame.origin.x, -self.view.frame.height + 60, self.view.frame.width, self.view.frame.height)
                }
                , completion: {
                    (value: Bool) in
            })
        }
        
    }
    
    @IBAction func zoom(recognizer : UITapGestureRecognizer) {
        
        if contentBoard.zoomScale < 0.74{
            contentBoard.setZoomScale(1, animated: true)
        }else{
            contentBoard.setZoomScale(0.73, animated: true)
        }
    }
    
    func scrollViewDidEndZooming(scrollView: UIScrollView, withView view: UIView!, atScale scale: CGFloat) {
        
        if scale < 0.74{
            horizontalScrollEnabled = false
        }else{
            horizontalScrollEnabled = true
        }
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if !horizontalScrollEnabled{
            contentBoard.contentOffset.x = 0
        }
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        if scrollView == contentBoard{
            return backOfContent
        }else {
            return nil
        }
    }
    
    func moveToCertainIndexForQuestion(){
        
        if indexOfEachQuestion[parentView.currentQuestion] != 0{
            
           println(self.view.frame.origin.y)
            
            contentBoard.setContentOffset(CGPointMake(contentBoard.contentOffset.x, (indexOfEachQuestion[parentView.currentQuestion] + views[parentView.currentPassage - 1][views[parentView.currentPassage - 1].count - 2].frame.origin.y - 100) * contentBoard.zoomScale + self.view.frame.origin.y), animated: true)
        }
    }
    
    func toPortrait(){
        contentBoard.minimumZoomScale = 0.73
        contentBoard.setZoomScale(0.73, animated: true)
        contentBoard.frame = CGRectMake(0, 0, 320, 435)
        puller.frame = CGRectMake(0, 400, 320, 40)
        pullerLine.frame = CGRectMake(0, 30, 320, 6)
        pullerTop.frame = CGRectMake(140, 30, 40, 10)
    }
    
    func toLandscape(){
        contentBoard.minimumZoomScale = 1
        contentBoard.setZoomScale(1, animated: true)
        contentBoard.frame = CGRectMake(0, 0, 440, 315)
        puller.frame = CGRectMake(0, 280, 440, 40)
        pullerLine.frame = CGRectMake(0, 30, 440, 6)
        pullerTop.frame = CGRectMake(200, 30, 40, 10)
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

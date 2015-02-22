
//
//  ContentViewController.swift
//  NEWSATHacker
//
//  Created by Kedan Li on 14/11/3.
//  Copyright (c) 2014年 Kedan Li. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet var contentBoard : UIScrollView!

    @IBOutlet var backOfContent : UIView!
    @IBOutlet var backOfDraft : UIView!

    var horizontalScrollEnabled = false
    
    var parentView: TakeTestViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        
        parentView = self.parentViewController as TakeTestViewController
        
        var count: CGFloat = 0
        backOfContent = UIView(frame: CGRectMake(0, 0, 440, 0))
        backOfContent.userInteractionEnabled = false
        backOfContent.backgroundColor = UIColor.clearColor()
        
        backOfDraft = UIView(frame: CGRectMake(0, 0, 440, 0))
        backOfDraft.userInteractionEnabled = true
        backOfDraft.backgroundColor = UIColor.clearColor()

        for item in parentView.views{
            item.frame = CGRectMake(0, count, item.frame.width, item.frame.height)
            backOfContent.addSubview(item)
            count = count + (item as UIView).frame.height
            
            var draft = SmoothLineView(frame: item.frame)
            backOfDraft.addSubview(draft)
            
            var line = UIImageView(frame: CGRectMake(0, 0, 440, 1))
            line.backgroundColor = UIColor(red: 226.0/255.0, green: 220.0/255.0, blue: 227.0/255.0, alpha: 1)
            draft.addSubview(line)
        }
        
        backOfContent.frame = CGRectMake(3, 0, 440, parentView.views[parentView.views.count - 1].frame.origin.y + parentView.views[parentView.views.count - 1].frame.height)
        backOfDraft.frame = backOfContent.frame
        backOfContent.addSubview(backOfDraft)
        contentBoard.contentSize = CGSizeMake(440, backOfContent.frame.height)
        contentBoard.addSubview(backOfContent)
        //don't call the delegate function early avoid nil error
        contentBoard.setZoomScale(0.73, animated: false)
        
        contentBoard.pinchGestureRecognizer.enabled = false
        
        var tapper = UITapGestureRecognizer(target: self, action: "zoom:")
        tapper.numberOfTapsRequired = 2
        contentBoard.addGestureRecognizer(tapper)
    }
    
    @IBAction func zoom(recognizer : UITapGestureRecognizer) {
                
        if contentBoard.zoomScale < 0.74{
            contentBoard.setZoomScale(1, animated: true)
        }else{
            contentBoard.setZoomScale(0.73, animated: true)
        }
        
    }

    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        parentView.scrollViewInControl = "content"
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        if !horizontalScrollEnabled{
            contentBoard.contentOffset.x = 0
        }
        
        if parentView.scrollViewInControl == "content"{
            
            if scrollView == contentBoard{
                
                rescaleScrollViewOffset()
            }
        }
    }
    
    func rescaleScrollViewOffset(){
    
        (parentView.childViewControllers[2] as DraggerViewController).numbersBoard.contentOffset = CGPointMake((parentView.childViewControllers[2] as DraggerViewController).calculateNumberOffset(self.contentBoard.contentOffset.y / contentBoard.zoomScale), (parentView.childViewControllers[2] as DraggerViewController).numbersBoard.contentOffset.y)
        (parentView.childViewControllers[2] as DraggerViewController).dragBoard.contentOffset = CGPointMake(self.contentBoard.contentOffset.y / contentBoard.zoomScale, 0)
        
    }
    
    func scrollViewDidEndZooming(scrollView: UIScrollView, withView view: UIView!, atScale scale: CGFloat) {
        
        if scale < 0.74{
            horizontalScrollEnabled = false
        }else{
            horizontalScrollEnabled = true
        }
        
        rescaleScrollViewOffset()
        
    }

    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        if scrollView == contentBoard{
            return backOfContent
        }else {
            return nil
        }
    }
   
    func toPortrait(){
        contentBoard.minimumZoomScale = 0.73
        contentBoard.setZoomScale(0.73, animated: true)
    }
    
    func toLandscape(){
        contentBoard.minimumZoomScale = 1
        contentBoard.setZoomScale(1, animated: true)
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

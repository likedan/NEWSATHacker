
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

    
    var views : [UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        
        var count: CGFloat = 0
        backOfContent = UIView(frame: CGRectMake(0, 0, 440, 0))
        backOfContent.userInteractionEnabled = false
        backOfContent.backgroundColor = UIColor.clearColor()
        
        backOfDraft = UIView(frame: CGRectMake(0, 0, 440, 0))
        backOfDraft.userInteractionEnabled = true
        backOfDraft.backgroundColor = UIColor.clearColor()

        for item in views{
            item.frame = CGRectMake(0, count, item.frame.width, item.frame.height)
            backOfContent.addSubview(item)
            count = count + (item as UIView).frame.height
            
            var draft = SmoothLineView(frame: item.frame)
            backOfDraft.addSubview(draft)
        }
        
        backOfContent.frame = CGRectMake(0, 0, 440, views[views.count - 1].frame.origin.y + views[views.count - 1].frame.height)
        backOfDraft.frame = backOfContent.frame
        backOfContent.addSubview(backOfDraft)
        contentBoard.contentSize = CGSizeMake(440, backOfContent.frame.height)
        contentBoard.addSubview(backOfContent)
        
        contentBoard.minimumZoomScale = 0.7
        contentBoard.maximumZoomScale = 1
    }
    
    func scrollViewDidEndZooming(scrollView: UIScrollView, withView view: UIView!, atScale scale: CGFloat) {
        scrollView.scrollEnabled = true
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        if scrollView == contentBoard{
            return backOfContent
        }else {
            return nil
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

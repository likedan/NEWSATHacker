//
//  PassageViewController.swift
//  NEWSATHacker
//
//  Created by Kedan Li on 14/11/7.
//  Copyright (c) 2014年 Kedan Li. All rights reserved.
//

import UIKit

class PassageViewController: UIViewController, UIScrollViewDelegate{

    @IBOutlet var contentBoard : UIScrollView!
    @IBOutlet var puller : UIView!
    @IBOutlet var pullerLine : UIView!
    @IBOutlet var pullerTop : UIView!
    
    var parentView: TakeTestViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(animated)
        
        parentView = self.parentViewController as TakeTestViewController
        
        var views = [AnyObject]()
        let generator: GenerateContentForTest = GenerateContentForTest()
        views = generator.generatePassage(parentView.testData)
        contentBoard.contentSize = CGSizeMake(440, views[2][views[2].count - 1].frame.height)
        for items in views[2] as [UIView]{
            items.userInteractionEnabled = false
            contentBoard.addSubview(items)
        }
        
        var gestureReco = UIPanGestureRecognizer(target: self, action: "dragged:")
        puller.addGestureRecognizer(gestureReco)
    }
    
    @IBAction func dragged(recognizer : UIPanGestureRecognizer) {
        
        let translatedPoint = recognizer.translationInView(self.view)
        
        let y = self.view.center.y + translatedPoint.y
        recognizer.setTranslation(CGPointMake(0, 0), inView: self.view)
        self.view.center = CGPointMake(self.view.center.x, y);
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

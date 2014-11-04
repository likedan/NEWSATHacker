//
//  TakeTestViewController.swift
//  NEWSATHacker
//
//  Created by Kedan Li on 14/11/3.
//  Copyright (c) 2014年 Kedan Li. All rights reserved.
//

import UIKit

class TakeTestViewController: UIViewController {

    @IBOutlet var content : UIView!
    @IBOutlet var dragger : UIView!
    @IBOutlet var choices : UIView!

    var scrollViewInControl = "content"
    
    var views : [UIView]!

    var sectionInfo: [AnyObject]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var str: String = (sectionInfo[1] as NSString).substringToIndex(1) as String
        let generator: GenerateContentForTest = GenerateContentForTest()
        views = generator.generateContent(DataManager.getASectionTest(sectionInfo[0] as String, month: sectionInfo[1] as String, section: (sectionInfo[2] as NSString).substringToIndex(1) as String))
        
        
        // Do any additional setup after loading the view.
    }
    
    override func willAnimateRotationToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
        if toInterfaceOrientation == UIInterfaceOrientation.Portrait || toInterfaceOrientation == UIInterfaceOrientation.PortraitUpsideDown {
            content.frame = CGRectMake(0, 0, 320, 440)
            dragger.transform = CGAffineTransformMakeRotation(0)
            dragger.frame = CGRectMake(0, 440, 320, 60)

            (self.childViewControllers[0] as ContentViewController).toPortrait()
            (self.childViewControllers[2] as DraggerViewController).toPortrait()

        }
        else if toInterfaceOrientation == UIInterfaceOrientation.LandscapeLeft || toInterfaceOrientation == UIInterfaceOrientation.LandscapeRight{
            choices.removeFromSuperview()
            content.frame = CGRectMake(60, 0, 440, 320)
            dragger.transform = CGAffineTransformMakeRotation(3.14/2)
            dragger.frame = CGRectMake(0, 0, 60, 320)
            
            (self.childViewControllers[0] as ContentViewController).toLandscape()
            (self.childViewControllers[2] as DraggerViewController).toLandscape()
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

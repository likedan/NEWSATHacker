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

    @IBOutlet var header : UIView!
    
    @IBOutlet var completion : UILabel!
    @IBOutlet var menu : UIButton!
    

    
    var scrollViewInControl = "content"
    
    var views : [UIView]!

    var sectionInfo: [AnyObject]!
    
    var currentQuestion: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var str: String = (sectionInfo[1] as NSString).substringToIndex(1) as String
        let generator: GenerateContentForTest = GenerateContentForTest()
        views = generator.generateContent(DataManager.getASectionTest(sectionInfo[0] as String, month: sectionInfo[1] as String, section: (sectionInfo[2] as NSString).substringToIndex(1) as String))
        
        currentQuestion = 0
        // Do any additional setup after loading the view.
    }
    
    override func willAnimateRotationToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
        if toInterfaceOrientation == UIInterfaceOrientation.Portrait || toInterfaceOrientation == UIInterfaceOrientation.PortraitUpsideDown {
            header.frame = CGRectMake(0, 0, 320, 30)
            content.frame = CGRectMake(0, 0, 320, 440)
            dragger.transform = CGAffineTransformMakeRotation(0)
            dragger.frame = CGRectMake(0, 440, 320, 64)
            choices.transform = CGAffineTransformMakeRotation(0)
            choices.frame = CGRectMake(0, 504, 320, 64)

            (self.childViewControllers[0] as ContentViewController).toPortrait()
            (self.childViewControllers[1] as ChoicesViewController).toPortrait()
            (self.childViewControllers[2] as DraggerViewController).toPortrait()

        }
        else if toInterfaceOrientation == UIInterfaceOrientation.LandscapeLeft || toInterfaceOrientation == UIInterfaceOrientation.LandscapeRight{
            content.frame = CGRectMake(64, 0, 440, 320)
            dragger.transform = CGAffineTransformMakeRotation(3.14/2)
            dragger.frame = CGRectMake(0, 0, 64, 320)
            choices.transform = CGAffineTransformMakeRotation(-3.14/2)
            choices.frame = CGRectMake(504, 0, 64, 320)

            (self.childViewControllers[0] as ContentViewController).toLandscape()
            (self.childViewControllers[1] as ChoicesViewController).toLandscape()
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

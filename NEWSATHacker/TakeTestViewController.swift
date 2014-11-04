//
//  TakeTestViewController.swift
//  NEWSATHacker
//
//  Created by Kedan Li on 14/11/3.
//  Copyright (c) 2014年 Kedan Li. All rights reserved.
//

import UIKit

class TakeTestViewController: UIViewController {

    var sectionInfo: [AnyObject]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var str: String = (sectionInfo[1] as NSString).substringToIndex(1) as String
        let generator: GenerateContentForTest = GenerateContentForTest()
        (self.childViewControllers[0] as ContentViewController).views = generator.generateContent(DataManager.getASectionTest(sectionInfo[0] as String, month: sectionInfo[1] as String, section: (sectionInfo[2] as NSString).substringToIndex(1) as String))
        // Do any additional setup after loading the view.
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

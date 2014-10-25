//
//  MainViewController.swift
//  NEWSATHacker
//
//  Created by Kedan Li on 14/10/25.
//  Copyright (c) 2014年 Kedan Li. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var mainBoard : Scroller!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainBoard = Scroller(frame: CGRectMake(0, 60, 320, 450), numberOfViews: 3)
        self.view.addSubview(self.mainBoard)
        var cc = UIImageView(frame: CGRectMake(0, 0, 320, 450))
        cc.image = UIImage(named: "background")
        self.mainBoard.views[0].addSubview(cc)
        //self.mainBoard.views[2].addSubview(cc)
        //self.mainBoard.views[1].addSubview(cc)

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

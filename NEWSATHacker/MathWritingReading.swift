
//
//  MathWritingReading.swift
//  NEWSATHacker
//
//  Created by Kedan Li on 14/10/26.
//  Copyright (c) 2014年 Kedan Li. All rights reserved.
//

import UIKit

class MathWritingReading: UIView {

    @IBOutlet var math : UIButton!
    @IBOutlet var reading : UIButton!
    @IBOutlet var writing : UIButton!

    @IBOutlet var main1 : MathWritingReading!

    override init(frame: CGRect){
        super.init(frame: frame)
        
        math = UIButton(frame: CGRectMake(8, 30, 304, 110))
        math.addTarget(self, action: "mathClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        math.setImage(UIImage(named: "DefaultViewSectionButton"), forState: UIControlState.Normal)
        var mathLab = UILabel(frame: CGRectMake(0, 0, 304, 110))
        mathLab.text = "Math"
        mathLab.font = UIFont(name: "AvenirNext-Heavy", size: 25)
        mathLab.textAlignment = NSTextAlignment.Center
        mathLab.textColor = UIColor.darkGrayColor()
        math.addSubview(mathLab)
        
        reading = UIButton(frame: CGRectMake(8, 153, 304, 110))
        reading.setImage(UIImage(named: "DefaultViewSectionButton"), forState: UIControlState.Normal)
        var readingLab = UILabel(frame: CGRectMake(0, 0, 304, 110))
        readingLab.text = "Reading"
        readingLab.font = UIFont(name: "AvenirNext-Heavy", size: 25)
        readingLab.textAlignment = NSTextAlignment.Center
        readingLab.textColor = UIColor.darkGrayColor()
        reading.addSubview(readingLab)
        
        writing = UIButton(frame: CGRectMake(8, 277, 304, 110))
        writing.setImage(UIImage(named: "DefaultViewSectionButton"), forState: UIControlState.Normal)
        var writingLab = UILabel(frame: CGRectMake(0, 0, 304, 110))
        writingLab.text = "Writing"
        writingLab.font = UIFont(name: "AvenirNext-Heavy", size: 25)
        writingLab.textAlignment = NSTextAlignment.Center
        writingLab.textColor = UIColor.darkGrayColor()
        writing.addSubview(writingLab)
        
        self.addSubview(math)
        self.addSubview(writing)
        self.addSubview(reading)
        
    }
    
    func chosen(){
        
        UIView.animateWithDuration(1, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
            
            var t4 = CGAffineTransformMakeScale(0.8, 0.8)
            var t5 = CGAffineTransformMakeTranslation(-320, 0)
            var t6 = CGAffineTransformMakeRotation(1.2)
            
            self.math.transform = CGAffineTransformConcat(t4, CGAffineTransformConcat(t5, t6))
            self.reading.transform = CGAffineTransformConcat(t4, CGAffineTransformConcat(t5, t6))
            self.writing.transform = CGAffineTransformConcat(t4, CGAffineTransformConcat(t5, t6))
            
            }
            , completion: {
                (value: Bool) in
                
                
                
        })

        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}

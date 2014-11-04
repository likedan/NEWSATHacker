//
//  GenerateContentForTest.swift
//  NEWSATHacker
//
//  Created by Kedan Li on 14/11/3.
//  Copyright (c) 2014年 Kedan Li. All rights reserved.
//

import UIKit


// This class format the content of exam into an UIViews(a question each) and return them

class GenerateContentForTest: NSObject {
   
    var theFontSize: CGFloat = 18.0
    
    func generateContent(content:[String: AnyObject])->[UIView]{
        
        var result = [UIView]()
        
        if content["type"] as String == "reading"{
            result = self.generateContentForReading(content["Questions"] as [AnyObject]) as [UIView]
        }
        
        return result
        
    }
    
    func generateContentForReading(content: [AnyObject])->[UIView]{
        
        var result = [UIView]()

        for var index: Int = 0; index < content.count; index++ {
            
            var content: String = "\(index + 1). " + (content[index]["question"] as String) + "\nA. " + (content[index]["a"] as String) + "\nB. " + (content[index]["b"] as String) + "\nC. " + (content[index]["c"] as String) + "\nD. " + (content[index]["d"] as String) + "\nE. " + (content[index]["e"] as String) + "\n"
            
            var textView = UITextView(frame: CGRectMake(0, 0, 440, 10))
            textView.font = UIFont(name: "TimesNewRomanPSMT", size: theFontSize)
            textView.text = content
            textView.userInteractionEnabled = false
            textView.sizeToFit()
            
            println(textView.frame.height)
            println(textView.frame.width)

            result.append(textView)
            //content =
            
        }

        return result
        
    }
    
}

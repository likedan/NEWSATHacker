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
            

            result.append(textView)
            //content =
            
        }

        return result
        
    }
    
    
    func generatePassage(content:[String: AnyObject])->[AnyObject]{
        
        var result = [AnyObject]()
        
        if content["type"] as String == "reading"{
            result = self.generateContentForReadingPassage(content) as [AnyObject]
        }
        
        return result
        
    }
    
    func generateContentForReadingPassage(data: [String: AnyObject])->[AnyObject]{
        
        var result = [AnyObject]()
        
        for items in (data["Passages"] as [AnyObject]){
            
            var aPassage = [UIView]()

            var text = UITextView(frame: CGRectMake(15, 0, 430, 100))
            text.editable = false
            text.font = UIFont(name: "TimesNewRomanPS-BoldMT", size: theFontSize)
            text.text = "\n\n\n\n\n\n\nQuestions " + (items["questions"] as String) + " are based on the following passage."
            text.sizeToFit()
            
            aPassage.append(text)

            
            if items["italic"] as String != ""{
            
                text = UITextView(frame: CGRectMake(15, 0, 430, 100))
                text.editable = false
                text.font = UIFont(name: "TimesNewRomanPS-ItalicMT", size: theFontSize)
                text.text = items["italic"] as String
                text.sizeToFit()
                
                aPassage.append(text)
            }

            if items["style"] as String == "normal"{
            
                text = UITextView(frame: CGRectMake(15, 0, 430, 100))
                text.editable = false
                text.font = UIFont(name: "TimesNewRomanPSMT", size: theFontSize)
                text.text = items["body"] as String
                text.sizeToFit()
                
                aPassage.append(text)
            
            }
            
            for var index = 1; index < aPassage.count; index++ {
                aPassage[index].frame = CGRectMake(aPassage[index].frame.origin.x, aPassage[index - 1].frame.origin.y + aPassage[index - 1].frame.height, aPassage[index].frame.width, aPassage[index].frame.height)
                }
            
            var labelContainer = UIView(frame: CGRectMake(0, 0, 25, 20))
            
            for var index = 1; index <= Int(aPassage[aPassage.count - 1].frame.height / 103.5); index++ {
                
                var leftNumbers = UILabel(frame: CGRectMake(-5, -10 + CGFloat(index) * 103.5 + aPassage[aPassage.count - 1].frame.origin.y, 25, 20))
                leftNumbers.textAlignment = NSTextAlignment.Center
                leftNumbers.text = "\(index * 5)"
                leftNumbers.font = UIFont(name: "TimesNewRomanPS-ItalicMT", size: 13)
                labelContainer.addSubview(leftNumbers)
            }
            labelContainer.frame = CGRectMake(0, 0, 25, labelContainer.subviews[labelContainer.subviews.count - 1].frame.origin.y + labelContainer.subviews[labelContainer.subviews.count - 1].frame.height + 20)
            aPassage.append(labelContainer)
            
            result.append(aPassage)
            
        }
        
        return result
        
    }

    func calculateIndexOfEachQuestionInReading(testData: [String: AnyObject])->[CGFloat]{
        var questions = testData["Questions"] as [AnyObject]
        
        var indexOfEachQuestion = [CGFloat]()
        
        for items in questions{
            if items["Passage"] as String == "0"{
                indexOfEachQuestion.append(0)
            }else{
                
                if items["surrounding"] as String == "NO"{
                    
                    indexOfEachQuestion.append(0)
                    
                }else{
                    
                    var passageText = (testData["Passages"] as [AnyObject])[(items["Passage"] as String).toInt()! - 1]["body"] as String
                    
                    passageText = passageText.substringToIndex(passageText.rangeOfString(items["surrounding"] as String)!.startIndex)
                    
                    var text = UITextView(frame: CGRectMake(0, 0, 430, 5))
                    text.font = UIFont(name: "TimesNewRomanPSMT", size: theFontSize)
                    text.text = passageText
                    text.sizeToFit()
                    //如果从第一行开始就是
                    if text.frame.height == 0 {
                        indexOfEachQuestion.append(1)
                    }else{
                        indexOfEachQuestion.append(text.frame.height)
                    }
                    println(text.frame)
                    println(text.text)
                }
            }
        }
        return indexOfEachQuestion
    }
    
}

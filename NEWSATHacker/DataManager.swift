//
//  DataManager.swift
//  NBillBoard
//
//  Created by Kedan Li on 14-9-27.
//  Copyright (c) 2014年 Kedan Li. All rights reserved.
//

import UIKit

class DataManager: NSObject {
       
    class func initializeUserInfo(){
        
        let fileManager = NSFileManager()
        var path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        path = path.stringByAppendingPathComponent("Chapters.plist")
        var resource = NSBundle.mainBundle().pathForResource("Chapters", ofType: "plist") as String?
        
        var dict = NSDictionary(contentsOfFile: resource!)
        fileManager.copyItemAtPath(resource!, toPath: path, error: nil)
        
        path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        path = path.stringByAppendingPathComponent("2014May4.plist")
        resource = NSBundle.mainBundle().pathForResource("2014May4", ofType: "plist") as String?
        dict = NSDictionary(contentsOfFile: resource!)
        fileManager.copyItemAtPath(resource!, toPath: path, error: nil)

    }
    
    class func getChapInfo() -> [String: AnyObject]{
        
        let fileManager = NSFileManager()
        var path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        path = path.stringByAppendingPathComponent("Chapters.plist")
        
        let dict = NSDictionary(contentsOfFile: path)
        println(path)
        return dict as [String: AnyObject]
        
    }
    
    class func getASectionTest(year: String, month: String, section: String) -> [String: AnyObject]{
        
        let fileManager = NSFileManager()
        var path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        path = path.stringByAppendingPathComponent("\(year)\(month)\(section)")
        
        let dict = NSDictionary(contentsOfFile: path)
        println(path)
        return dict as [String: AnyObject]
        
    }
}
    /*
    class func saveUserInfoToLocal(info: [String: AnyObject]){

        let fileManager = NSFileManager()
        var path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        path = path.stringByAppendingPathComponent("UserInformation.plist")
        
        
        let dict : NSDictionary = info
        dict.writeToFile(path, atomically: true)

    }
    //emails can contain ""
    //if a email is "", delete it
    class func addAGroup(name: String, emails: [AnyObject]){
        
        let fileManager = NSFileManager()
        var path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        path = path.stringByAppendingPathComponent("UserInformation.plist")
        
        var dict : NSMutableDictionary = NSMutableDictionary(contentsOfFile: path)!
        
        var bills: NSMutableDictionary = NSMutableDictionary(object: [AnyObject](), forKey: "bills")
        
        var emailDict : NSMutableDictionary = NSMutableDictionary()
        
        for email in emails{
            
            if email as String != ""{
                var personName: String = ""
                if dict.objectForKey("friendList")?.valueForKey(email as String) != nil{
                    personName = (dict.objectForKey("friendList") as [String: AnyObject])[email as String]! as String
                }
                emailDict.setObject("", forKey: email as String)
            }
        }
        
        bills.setObject(emailDict, forKey: "members")
        
        dict.objectForKey("myBills")?.setObject(bills, forKey:name)
        
        dict.writeToFile(path, atomically: true)
        println(path)
    }
    
    
    
}



+(void)initializeEveryPlist{

NSFileManager *fileManager = [NSFileManager defaultManager];

NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
NSString *documents = [paths objectAtIndex:0];
NSString *database_path = [documents stringByAppendingPathComponent: @"UserInformation.plist"];

NSString *resource = [[NSBundle mainBundle]pathForResource:@"UserInfo" ofType:@"plist"];

NSMutableDictionary *allContents = [[NSMutableDictionary alloc] initWithContentsOfFile:resource];
NSString *encodedStr = [BillBoardDataManager encoding:allContents];

[allContents removeAllObjects];
[allContents setObject:encodedStr forKey:@"info"];
[fileManager copyItemAtPath:resource toPath:database_path error:nil];
[allContents writeToFile:database_path atomically:YES];

}
*/
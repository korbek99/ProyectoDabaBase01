//
//  Util.swift
//  ProyectoDabaBase
//
//  Created by Henry AT on 8/19/15.
//  Copyright (c) 2015 Apps4s. All rights reserved.
//


import UIKit

class Util: NSObject {
  
  class func getPath(fileName: String) -> String {
    return NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0].stringByAppendingPathComponent(fileName)
  }
  
  class func copyFile(fileName: NSString) {
    let dbPath: String = getPath(fileName as String)
    let fileManager = NSFileManager.defaultManager()
    if !fileManager.fileExistsAtPath(dbPath) {
      
      let fromPath: String? = NSBundle.mainBundle().resourcePath?.stringByAppendingPathComponent(fileName as String)
      var error : NSError?
      do {
        try fileManager.copyItemAtPath(fromPath!, toPath: dbPath)
      } catch let error1 as NSError {
        error = error1
      }
      let alert: UIAlertView = UIAlertView()
      if (error != nil) {
        alert.title = "Error Occured"
        alert.message = error?.localizedDescription
      } else {
        alert.title = "Successfully Copy"
        alert.message = "Your database copy successfully"
      }
      alert.delegate = nil
      alert.addButtonWithTitle("Ok")
      alert.show()
    }
  }
  
  class func invokeAlertMethod(strTitle: NSString, strBody: NSString, delegate: AnyObject?) {
    let alert: UIAlertView = UIAlertView()
    alert.message = strBody as String
    alert.title = strTitle as String
    alert.delegate = delegate
    alert.addButtonWithTitle("Ok")
    alert.show()
  }
  
}
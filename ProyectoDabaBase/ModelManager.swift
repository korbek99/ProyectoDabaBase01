//
//  ModelManager.swift
//  ProyectoDabaBase
//
//  Created by Henry AT on 8/19/15.
//  Copyright (c) 2015 Apps4s. All rights reserved.
//

import UIKit

let sharedInstance = ModelManager()


class ModelManager: NSObject {
  
  var database: FMDatabase? = nil
  
  
  class var instance: ModelManager {
    sharedInstance.database = FMDatabase(path: Util.getPath("DataBaseDemo.sqlite"))
    let path = Util.getPath("DataBaseDemo.sqlite")
    //54D70B97-F386-4746-9A69-692E339668B8
    print("path : \(path)")
    return sharedInstance
  }
  
  func addStudentData(studentInfo: StudentInfo) -> Bool {
    sharedInstance.database!.open()
    let isInserted = sharedInstance.database!.executeUpdate("INSERT INTO StudentInfo (student_rollno, student_name) VALUES (?, ?)", withArgumentsInArray: [studentInfo.studentRollNo, studentInfo.studentName])
    sharedInstance.database!.close()
    return isInserted
  }
  
  func updateStudentData(studentInfo: StudentInfo) -> Bool {
    sharedInstance.database!.open()
    let isUpdated = sharedInstance.database!.executeUpdate("UPDATE StudentInfo SET student_name=? WHERE student_rollno=?", withArgumentsInArray: [studentInfo.studentName, studentInfo.studentRollNo])
    sharedInstance.database!.close()
    return isUpdated
  }
  
  func deleteStudentData(studentInfo: StudentInfo) -> Bool {
    sharedInstance.database!.open()
    let isDeleted = sharedInstance.database!.executeUpdate("DELETE FROM StudentInfo WHERE student_rollno=?", withArgumentsInArray: [studentInfo.studentRollNo])
    sharedInstance.database!.close()
    return isDeleted
  }
  
  func getAllStudentData() {
    sharedInstance.database!.open()
    let resultSet: FMResultSet! = sharedInstance.database!.executeQuery("SELECT * FROM StudentInfo", withArgumentsInArray: nil)
    let rollNoColumn: String = "student_rollno"
    let nameColumn: String = "student_name"
    if (resultSet != nil) {
      while resultSet.next() {
        print("roll no : \(resultSet.stringForColumn(rollNoColumn))")
        print("name : \(resultSet.stringForColumn(nameColumn))")
      }
    }
    sharedInstance.database!.close()
  }
  
}

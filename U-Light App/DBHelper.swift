//
//  DBHelper.swift
//  U-Light App
//
//  Created by R95 on 18/03/24.
//

import Foundation
import UIKit
import SQLite3

struct UserData {
    var email: String
    var password: String
}

class DBHelper {
    static var file : OpaquePointer?
    public static var userDataArray = [UserData]()
    
    static func createFile() {
        var a = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        a.appendPathComponent("U-Light User Data.db")
        sqlite3_open(a.path, &file)
        print("Creat A File")
        print(a.path)
        creatTable()
    }
    
    static func creatTable() {
        let quary = "Create Table if not exists UserData (email text,password text)"
        var table: OpaquePointer?
        sqlite3_prepare(file, quary, -1, &table, nil)
        sqlite3_step(table)
        print("Create Table")
    }
    
    static func addData(email: String, password: String) {
        let quary = "insert into userData values ('\(email)', '\(password)')"
        var add: OpaquePointer?
        sqlite3_prepare(file, quary, -1, &add, nil)
        sqlite3_step(add)
        print("add data")
    }
    
    static func getData() {
        let quary = "SELECT * FROM UserData"
        var read: OpaquePointer?
        sqlite3_prepare(file, quary, -1, &read, nil)
        
        
        while sqlite3_step(read) == SQLITE_ROW {
            if let email = sqlite3_column_text(read, 0),
               let password = sqlite3_column_text(read, 1) {
                let userEmail = String(cString: email)
                let userPassword = String(cString: password)
                let userData = UserData(email: userEmail, password: userPassword)
                userDataArray.append(userData)
                print("Email: \(userEmail), Password: \(userPassword)")
            }
        }
    }
}

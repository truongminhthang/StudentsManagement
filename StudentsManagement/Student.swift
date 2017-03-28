//
//  Student.swift
//  StudentsManagement
//
//  Created by Trương Thắng on 3/27/17.
//  Copyright © 2017 Trương Thắng. All rights reserved.
//

import Foundation

class Student: NSObject {
    
    var name: String
    var phoneNumber: String
    
    init?(name: String, phoneNumber: String) {
        guard name != "" else {return nil}
        var isNameHaveNumber : Bool = false
        for str in name.characters.map({String($0)}) {
            if Int(str) != nil {
                isNameHaveNumber = true
                break
            }
        }
        guard isNameHaveNumber == false  else { return nil }
        guard [10,11].contains(phoneNumber.characters.count) else { return nil}
        guard Int(phoneNumber) != nil else {return nil}
        self.name = name
        self.phoneNumber = phoneNumber
    }
    
}


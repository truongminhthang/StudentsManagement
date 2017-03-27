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
        guard phoneNumber.characters.count >= 10 else {return nil}
        self.name = name
        self.phoneNumber = phoneNumber
    }
    
}


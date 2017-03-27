//
//  Services.swift
//  StudentsManagement
//
//  Created by Trương Thắng on 3/27/17.
//  Copyright © 2017 Trương Thắng. All rights reserved.
//

import Foundation

class DataServices {
    static let shared : DataServices = DataServices()
    
    private var _students : [Student]?
    var students : [Student] {
        get {
            if _students == nil {
                updateStudents()
            }
            return _students!
        }
        set {
            _students = newValue
        }
    }
    
    func updateStudents() {
        _students = []
        for i in Array (0 ... 100) {
            guard let student = Student(name: "Name \(i)", phoneNumber: "012391801\(i)") else {continue}
            _students?.append(student)
        }
    }
}

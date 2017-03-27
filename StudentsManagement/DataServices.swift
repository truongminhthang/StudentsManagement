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
    
    private var _students : [String]?
    var students : [String] {
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
        _students = ["Tĩnh", "Việt", "Hoàng", "Đức", "Phú"]
    }
}

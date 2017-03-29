//
//  Services.swift
//  StudentsManagement
//
//  Created by Trương Thắng on 3/27/17.
//  Copyright © 2017 Trương Thắng. All rights reserved.
//

import Foundation
import os.log

class DataServices {
    static let shared : DataServices = DataServices()
    
    private var _students : [Student]?
    var students : [Student] {
        get {
            if _students == nil {
                updateStudents()
            }
            return _students ?? []
        }
        set {
            _students = newValue
        }
    }
    
    func updateStudents() {
        _students = NSKeyedUnarchiver.unarchiveObject(withFile: Student.ArchiveURL.path) as? [Student]
    }
    
    private func saveStudents() {
        guard _students != nil else { return }
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(_students!, toFile: Student.ArchiveURL.path)
        if isSuccessfulSave {
            os_log("Student successfully saved.", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save Student...", log: OSLog.default, type: .error)
        }
    }
    
    func removeStudent(at index: Int) {
        _students?.remove(at: index)
        saveStudents()
    }
    
    func appendStudent(student: Student?) {
        guard student != nil else {return}
        if _students == nil {
            _students = []
        }
        _students?.insert(student!, at: 0)
        saveStudents()
    }
    
    func replace(student: Student, at index: Int) {
        _students![index] = student
        saveStudents()
    }
    
}



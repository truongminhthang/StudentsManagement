//
//  Student.swift
//  StudentsManagement
//
//  Created by Trương Thắng on 3/27/17.
//  Copyright © 2017 Trương Thắng. All rights reserved.
//

import UIKit

class Student: NSObject {
    
    var name: String
    var phoneNumber: String
    var image: UIImage?
    
    init?(name: String, phoneNumber: String, image: UIImage?) {
        guard name != "" else {return nil}
        var isNameHaveNumber : Bool = false
        for str in name.characters.map({String($0)}) {
            if Int(str) != nil {
                isNameHaveNumber = true
                break
            }
        }
        guard isNameHaveNumber == false  else { return nil }
        let phoneNumberTrimmed = phoneNumber.trimmingCharacters(in: .whitespacesAndNewlines)
        guard [10,11].contains(phoneNumberTrimmed.characters.count) else { return nil}
        guard Int(phoneNumberTrimmed) != nil else {return nil}
        self.name = name
        self.phoneNumber = phoneNumberTrimmed
        self.image = image
    }
    
}


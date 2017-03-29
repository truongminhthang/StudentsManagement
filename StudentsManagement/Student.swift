//
//  Student.swift
//  StudentsManagement
//
//  Created by Trương Thắng on 3/27/17.
//  Copyright © 2017 Trương Thắng. All rights reserved.
//

import UIKit

class Student: NSObject, NSCoding {
    
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
    
    static var DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("students")
    
    
    struct PropertyKey {
        static let name = "name"
        static let phoneNumber = "phoneNumber"
        static let image = "image"
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(phoneNumber, forKey: PropertyKey.phoneNumber)
        aCoder.encode(image, forKey: PropertyKey.image)

    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: PropertyKey.name) as! String
        let phoneNumber = aDecoder.decodeObject(forKey: PropertyKey.phoneNumber) as! String
        let image = aDecoder.decodeObject(forKey: PropertyKey.image) as? UIImage
        self.init(name: name, phoneNumber: phoneNumber, image: image)
    }
    
    
    
}


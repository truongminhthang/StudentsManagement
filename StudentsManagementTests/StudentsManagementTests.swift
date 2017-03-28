//
//  StudentsManagementTests.swift
//  StudentsManagementTests
//
//  Created by Trương Thắng on 3/27/17.
//  Copyright © 2017 Trương Thắng. All rights reserved.
//

import XCTest

class StudentTest: XCTestCase {
    
   
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testStudent() {
        XCTAssertTrue(Student(name: "", phoneNumber: "01239180123") == nil)
        XCTAssertTrue(Student(name: "Thang", phoneNumber: "0123") == nil)
        XCTAssertTrue(Student(name: "", phoneNumber: "") == nil)
        XCTAssertTrue(Student(name: "Thang1", phoneNumber: "01239180123") == nil)
        XCTAssertTrue(Student(name: "Thang1", phoneNumber: "012391801a3") == nil)
        XCTAssertTrue(Student(name: "Thang", phoneNumber: "01239180123") != nil)


    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

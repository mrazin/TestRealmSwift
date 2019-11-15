//
//  authTestTests.swift
//  authTestTests
//
//  Created by WSR on 07/11/2019.
//  Copyright © 2019 WSR. All rights reserved.
//

import XCTest
@testable import authTest

class authTestTests: XCTestCase {

    
    var sut: ViewController!
    override func setUp() {
    sut = ViewController()
    }

    override func tearDown() {
       sut = nil
    }

    func testLogAndPassTrue() {
      let username = "111"
       let pass = "111"
       let bool = sut.logpass(name: username, pass: pass)
       XCTAssertTrue(bool)
       
    }
     func testLogAndPassFalse() {
       let username = ""
        let pass = ""
        let bool = sut.logpass(name: username, pass: pass)
        XCTAssertFalse(bool)
//        sut.authButton.sendActions(for: .touchUpInside)
        
     }
    

}

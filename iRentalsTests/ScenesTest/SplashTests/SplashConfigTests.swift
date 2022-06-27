//
//  SplashConfigTests.swift
//  iRentalsTests
//
//  Created by sahebroy on 24/06/22.
//

import XCTest
@testable import iRentals

class SplashConfigTests: XCTestCase {

    func testConfiguration() {
        let controller = SplashConfigurator.config()
        XCTAssertNotNil(controller)
        XCTAssertTrue(controller  is SplashViewController)
    }
}

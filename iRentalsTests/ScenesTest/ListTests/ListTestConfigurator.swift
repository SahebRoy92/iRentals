//
//  ListTestConfigurator.swift
//  iRentalsTests
//
//  Created by sahebroy on 26/06/22.
//

import XCTest
@testable import iRentals

class ListTestConfigurator: XCTestCase {
    func testConfig() {
        let listController = ListConfigurator.configController()
        XCTAssertNotNil(listController)
        XCTAssertTrue(listController  is ListViewController)
    }
}

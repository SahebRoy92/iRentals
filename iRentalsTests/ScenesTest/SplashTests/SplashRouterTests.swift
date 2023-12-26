//
//  SplashRouterTests.swift
//  iRentalsTests
//
//  Created by sahebroy on 26/06/22.
//

import XCTest
@testable import iRentals

class SplashRouterTests: XCTestCase {

    func testRouterNextController() {
        let dummyAnimation = SplashAnimationMock()
        let presenter = SplashPresenterMock.init(dummyAnimation)
        let router = SplashRouter(presenter)
        XCTAssertNotNil(router)
        XCTAssertNotNil(router.moveToHomeController())
    }

}

//
//  SplashViewControllerTests.swift
//  iRentalsTests
//
//  Created by sahebroy on 26/06/22.
//

import XCTest
@testable import iRentals

class SplashViewControllerTests: XCTestCase {
    
    func testConfiguration() {
        let dummyAnimation = SplashAnimationMock()
        let mockPresenter = SplashPresenterMock.init(dummyAnimation)
        let mockRouter = SplashRouterMock.init(mockPresenter)
        let controller = SplashViewController.init(mockPresenter, router: mockRouter)
        mockPresenter.controller = controller
        XCTAssertNotNil(controller)
        
        controller.viewDidLoad()
        XCTAssertTrue(mockPresenter.didSetup)
        
        controller.viewDidAppear(true)
        XCTAssertTrue(mockPresenter.didStart)
        
        controller.viewDidDisappear(true)
        XCTAssertTrue(mockPresenter.didDispose)
        
        mockPresenter.evokeDidFinishAnimation()
        XCTAssertTrue(mockRouter.didCallToMoveController)
        
    }
    
}

//
//  SplashPresenterTests.swift
//  iRentalsTests
//
//  Created by sahebroy on 24/06/22.
//

import XCTest
@testable import iRentals

class SplashPresenterTests: XCTestCase {

    let mockAnimation = SplashAnimationMock()
    var mockVC: SplashViewController?
    var presenter: SplashPresenter?
    
    func testInitialise() {
        presenter = SplashPresenter.init(mockAnimation)
        XCTAssertNotNil(mockAnimation)
        XCTAssertNotNil(presenter)
    }
    
    func testInvokation() {
        presenter = SplashPresenter.init(mockAnimation)
        guard let presenter = presenter else {
            XCTFail("Presenter not found----")
            return
        }
        
        presenter.controller = mockVC
        XCTAssertNotNil(presenter.splashAnimationView)
        presenter.disposeAnimation()
        XCTAssertTrue(mockAnimation.didDispose)
    }
    
    func testAnimationStart() {
        let presenter = SplashPresenter.init(mockAnimation)
        let mockVC = SplashMockController()
        presenter.controller = mockVC
        presenter.startAnimation()
        XCTAssertTrue(mockVC.didStart)
    }
    
    func testDisposeAnimationView() {
        let presenter = SplashPresenter.init(mockAnimation)
        presenter.disposeAnimation()
        XCTAssertTrue(mockAnimation.didDispose)
    }
    
    func testAnimationView() {
        let animationView = SplashAnimationView()
        let presenter = SplashPresenterMock.init(animationView)
        presenter.disposeAnimation()
        XCTAssertTrue(presenter.didDispose)
    }
}

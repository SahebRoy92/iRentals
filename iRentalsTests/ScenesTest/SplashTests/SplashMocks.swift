//
//  SplashMocks.swift
//  iRentalsTests
//
//  Created by sahebroy on 24/06/22.
//

import Foundation
@testable import iRentals
import Lottie

class SplashAnimationMock: SplashAnimationViewProtocols {
    
    var didDispose = false

    func configureSplashAnimationView() -> AnimationView {
        let animView = AnimationView()
        return animView
    }
    func stopAndDisposeAnimation() {
        didDispose = true
    }
}

class SplashMockController: SplashPresenterSenderProtocol {
    var didStart = false
    var didFinish = false
    
    func didStartAnimation() {
        didStart = true
    }
    
    func didFinishAnimation() {
        didFinish = true
    }
}

class SplashRouterMock: SplashRouterProtocol {
    var presenter: SplashPresenterRecieverProtocol
    var didCallToMoveController = false
    
    init(_ presenter: SplashPresenterRecieverProtocol) {
        self.presenter = presenter
    }
    
    func moveToHomeController() -> UIViewController {
        didCallToMoveController = true
        return UIViewController()
    }
}

class SplashPresenterMock: SplashPresenterRecieverProtocol {
    var splashAnimationView: SplashAnimationViewProtocols
    
    var didStart = false
    var didSetup = false
    var didDispose = false
    
    weak var controller: SplashPresenterSenderProtocol?
    
    init(_ animation: SplashAnimationViewProtocols) {
        self.splashAnimationView = animation
    }
    
    func startAnimation() {
        didStart = true
    }
    
    func setupAnimationView() -> AnimationView {
        didSetup = true
        return AnimationView()
    }
    
    func evokeDidFinishAnimation() {
        controller?.didFinishAnimation()
    }
    
    func disposeAnimation() {
        splashAnimationView.stopAndDisposeAnimation()
        didDispose = true
    }
}

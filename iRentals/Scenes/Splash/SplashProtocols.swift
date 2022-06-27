//
//  SplashProtocols.swift
//  iRentals
//
//  Created by sahebroy on 24/06/22.
//

import Foundation
import Lottie

protocol SplashPresenterSenderProtocol: AnyObject {
    func didFinishAnimation()
    func didStartAnimation()
}

protocol SplashAnimationViewProtocols {
    func configureSplashAnimationView() -> AnimationView
    func stopAndDisposeAnimation()
}

protocol SplashPresenterRecieverProtocol {
    var splashAnimationView: SplashAnimationViewProtocols { get set }
    func startAnimation()
    func setupAnimationView() -> AnimationView
    func disposeAnimation()
}

protocol SplashRouterProtocol {
    var presenter: SplashPresenterRecieverProtocol { get set }
    func moveToHomeController() -> UIViewController
}

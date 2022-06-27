//
//  SplashPresenter.swift
//  iRentals
//
//  Created by sahebroy on 24/06/22.
//

import Foundation
import Lottie

final class SplashPresenter: SplashPresenterRecieverProtocol {
    var splashAnimationView: SplashAnimationViewProtocols
    private var animationView: AnimationView?
    weak var controller: SplashPresenterSenderProtocol?
    
    init(_ animationView: SplashAnimationViewProtocols) {
        self.splashAnimationView = animationView
    }
    
    func startAnimation() {
        self.controller?.didStartAnimation()
        self.animationView?.play(completion: {  _ in
            self.controller?.didFinishAnimation()
        })
    }
    
    func setupAnimationView() -> AnimationView {
        if let hasAnimationView = self.animationView {
            return hasAnimationView
        }
        let newAnimationView = splashAnimationView.configureSplashAnimationView()
        self.animationView = newAnimationView
        return newAnimationView
    }
    
    func disposeAnimation() {
        self.splashAnimationView.stopAndDisposeAnimation()
    }
}

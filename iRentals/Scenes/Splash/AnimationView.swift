//
//  AnimationView.swift
//  iRentals
//
//  Created by sahebroy on 24/06/22.
//

import Foundation
import Lottie

final class SplashAnimationView: SplashAnimationViewProtocols {
    
    private var animView: AnimationView?
    
    func configureSplashAnimationView() -> AnimationView {
        let animView = AnimationView(name: Constants.AnimationFiles.splashAnimation)
        animView.contentMode = .scaleAspectFit
        animView.loopMode = .playOnce
        animView.backgroundColor = .clear
        self.animView = animView
        return animView
    }
    
    func stopAndDisposeAnimation() {
        animView?.stop()
        animView?.removeFromSuperview()
    }
}

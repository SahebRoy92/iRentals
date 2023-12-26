//
//  SplashConfigurator.swift
//  iRentals
//
//  Created by sahebroy on 24/06/22.
//

import Foundation
import UIKit

final class SplashConfigurator {
    static func config() -> UIViewController {
        BundleManager.shared.bundle = .main
        if let code = NSLocale.preferredLanguages.first, code.contains("en") {
            RentalAppManager.shared.currentLanguage = .english
        } else {
            RentalAppManager.shared.currentLanguage = .german
        }
        let splashAnimation = SplashAnimationView()
        let presenter = SplashPresenter.init(splashAnimation)
        let router = SplashRouter.init(presenter)
        let controller = SplashViewController.init(presenter, router: router)
        presenter.controller = controller
        return controller
    }
}

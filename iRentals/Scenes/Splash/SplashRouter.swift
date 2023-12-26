//
//  SplashRouter.swift
//  iRentals
//
//  Created by sahebroy on 24/06/22.
//

import Foundation
import UIKit

final class SplashRouter: SplashRouterProtocol {
    var presenter: SplashPresenterRecieverProtocol
    
    init(_ presenter: SplashPresenterRecieverProtocol) {
        self.presenter = presenter
    }
    
    func moveToHomeController() -> UIViewController {
        let tabbar = MainTabConfigurator.configController()
        return tabbar
    }
}

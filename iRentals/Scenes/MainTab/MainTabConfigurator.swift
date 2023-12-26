//
//  MainTabConfigurator.swift
//  iRentals
//
//  Created by sahebroy on 25/06/22.
//

import Foundation
import UIKit

final class MainTabConfigurator {
    static func configController () -> UITabBarController {
        let presenter = MainTabPresenter()
        let mainTabbar = MainTabController.init(presenter)
        return mainTabbar
    }
}

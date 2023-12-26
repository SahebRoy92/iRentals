//
//  MainTabrPresenter.swift
//  iRentals
//
//  Created by sahebroy on 25/06/22.
//

import Foundation
import SwiftUI

final class MainTabPresenter: MainTabbarPresenterRecieverProtocols {
    var localization: LocalizationInterface {
        RentalAppManager.shared.localization
    }
    weak var controller: MainTabbarPresenterSenderProtocols?
    
    private enum Images: String {
        case homeTabImage = "homeicon"
        case listTabImage = "listicon"
        
        case homeTabSelected = "bell.circle.fill"
        case listTabSelected = "bolt.circle.fill"
    }
    
    func configure() -> [MainTabModels] {
        
        let homeTab = MainTabModels.init(title: localization.tabMapTitle, image: Images.homeTabImage.rawValue, fillImage: Images.homeTabImage.rawValue, controller: MapViewConfigurator.configController())
        let listTab = MainTabModels.init(title: localization.tabListTitle, image: Images.listTabImage.rawValue, fillImage: Images.listTabImage.rawValue, controller: ListConfigurator.configController())
        return [homeTab, listTab]
    }
    
    func getTitle() -> String {
        return "iRental"
    }
}

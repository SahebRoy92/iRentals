//
//  MainTabProtocols.swift
//  iRentals
//
//  Created by sahebroy on 25/06/22.
//

import Foundation

protocol MainTabbarPresenterSenderProtocols: AnyObject {
    func setupComplete()
}

protocol MainTabbarPresenterRecieverProtocols {
    func configure() -> [MainTabModels]
    func getTitle() -> String
}

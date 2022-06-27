//
//  RentalAppManager.swift
//  iRentals
//
//  Created by sahebroy on 26/06/22.
//

import Foundation

class RentalAppManager {
    static let shared = RentalAppManager()
    private (set) var localization = RentalLocalization()
    
    var currentLanguage: Language = .init(rawValue: NSLocale.current.languageCode ?? "en") ?? .english {
        didSet {
            localization = RentalLocalization.init()
            localization.currentLanaguage = currentLanguage
        }
    }
}

//
//  Localization.swift
//  iRentals
//
//  Created by sahebroy on 22/06/22.
//

import Foundation

protocol LocalizationInterface {
    var splashTitle: String { get }
    var mapViewTitle: String { get }
    var refreshTitle: String { get }
    var listViewTitle: String { get }
    var tabMapTitle: String { get }
    var tabListTitle: String { get }
    var tabSettings: String { get }
    var detailTitle: String { get }
    var settingsLanguage: String { get }
    
    /** -- Localisation for Car details--*/
    var carName: String { get }
    var carModel: String { get }
    var carTransmission: String { get }
    var carMake: String { get }
    var carColor: String { get }
    var carFuelType: String { get }
    var carFuelLevel: String { get }
    var carCleanStatus: String { get }
    var carSeries: String { get }
    var carGroup: String { get }
    var carLicense: String { get }
    
    /**-- Alerts and common localisation -- **/
    var languageChangeAlert: String { get }
    var noNetwork: String { get }
    var serverError: String { get }
    var retry: String { get }
    var alertOk: String { get }
    var cancel: String { get }
    var unknown: String { get }
    var error: String { get }
}

enum Language: String, CaseIterable {
    case english = "en"
    case german = "ge"
}

class RentalLocalization: LocalizationInterface {
    
    private enum TextKeys: String {
        case splashTitle = "rentals_splash_title"
        case mapViewTitle = "rentals_mapview_title"
        case listViewTitle = "rentals_list_title"
        case tabMapTitle = "rentals_tab_map_title"
        case detailTitle = "rentals_detail_title"
        case tabListTitle = "rentals_tab_list_title"
        case tabSettings = "rentals_tab_settings"
        case settingsLanguage = "rentals_tab_language"
        case carName = "rentals_cars_name"
        case carModel = "rentals_cars_model"
        case carTransmission = "rentals_cars_transmission"
        case carMake = "rentals_cars_make"
        case carColor = "rentals_cars_color"
        case carFuelType = "rentals_cars_fuelType"
        case carFuelLevel = "rentals_cars_fuelLevel"
        case carCleanStatus = "rentals_cars_cleanstatus"
        case carSeries = "rentals_cars_series"
        case carGroup = "rentals_cars_group"
        case carLicense = "rentals_cars_license"
        case languageChangeAlert = "rentals_settings_alert"
        case noNetwork = "rentals_error_nonetwork"
        case serverError = "rentals_error_server_error"
        case retry = "rentals_error_retry"
        case alertOk = "rentals_common_ok"
        case cancel = "rentals_common_cancel"
        case unknown = "rentals_error_unknown"
        case error = "rentals_error"
        case refresh = "rentals_refresh"
    }
    
    var splashTitle: String {
        localizedString(TextKeys.splashTitle.rawValue)
    }
    
    var mapViewTitle: String {
        localizedString(TextKeys.mapViewTitle.rawValue)
    }
    
    var listViewTitle: String {
        localizedString(TextKeys.listViewTitle.rawValue)
    }
    
    var tabMapTitle: String {
        localizedString(TextKeys.tabMapTitle.rawValue)
    }
    
    var tabListTitle: String {
        localizedString(TextKeys.tabListTitle.rawValue)
    }
    
    var tabSettings: String {
        localizedString(TextKeys.tabSettings.rawValue)
    }
    
    var settingsLanguage: String {
        localizedString(TextKeys.settingsLanguage.rawValue)
    }
    
    var carName: String {
        localizedString(TextKeys.carName.rawValue)
    }
    
    var carModel: String {
        localizedString(TextKeys.carModel.rawValue)
    }
    
    var carTransmission: String {
        localizedString(TextKeys.carTransmission.rawValue)
    }
    
    var carMake: String {
        localizedString(TextKeys.carMake.rawValue)
    }
    
    var carColor: String {
        localizedString(TextKeys.carColor.rawValue)
    }
    
    var carFuelType: String {
        localizedString(TextKeys.carFuelType.rawValue)
    }
    
    var carFuelLevel: String {
        localizedString(TextKeys.carFuelLevel.rawValue)
    }

    var carSeries: String {
        localizedString(TextKeys.carSeries.rawValue)
    }
    
    var carGroup: String {
        localizedString(TextKeys.carGroup.rawValue)
    }
    
    var carLicense: String {
        localizedString(TextKeys.carLicense.rawValue)
    }
    
    var carCleanStatus: String {
        localizedString(TextKeys.carCleanStatus.rawValue)
    }
    
    var languageChangeAlert: String {
        localizedString(TextKeys.languageChangeAlert.rawValue)
    }
    
    var noNetwork: String {
        localizedString(TextKeys.noNetwork.rawValue)
    }
    
    var serverError: String {
        localizedString(TextKeys.serverError.rawValue)
    }
    
    var retry: String {
        localizedString(TextKeys.retry.rawValue)
    }
    
    var alertOk: String {
        localizedString(TextKeys.alertOk.rawValue)
    }
    
    var cancel: String {
        localizedString(TextKeys.cancel.rawValue)
    }
    
    var unknown: String {
        localizedString(TextKeys.unknown.rawValue)
    }
    
    var error: String {
        localizedString(TextKeys.error.rawValue)
    }
    
    var detailTitle: String {
        localizedString(TextKeys.detailTitle.rawValue)
    }
    
    var refreshTitle: String {
        localizedString(TextKeys.refresh.rawValue)
    }
    
    var currentLanaguage: Language = .english {
        didSet {
            loadBundleFromLanguage()
        }
    }
    var allLanguage = [String]()
    
    func getAllLanguages() -> [String] {
        self.allLanguage = Language.allCases.map({$0.rawValue})
        return allLanguage
    }
    
    func loadBundleFromLanguage() {
        if let path = BundleManager.shared.bundle?.path(forResource: currentLanaguage.rawValue.uppercased(), ofType: "bundle") {
            let bundlePath = URL.init(fileURLWithPath: path).appendingPathComponent("\(self.currentLanaguage.rawValue).lproj").path
            BundleManager.shared.bundle = Bundle.init(path: bundlePath)
        }
    }
    
    private func localizedString(_ key: String) -> String {
        NSLocalizedString(key, tableName: Constants.LocalizationFile.fileName, bundle: BundleManager.shared.bundle ?? Bundle.main, comment: key)
    }
}

//
//  LocalizationTests.swift
//  iRentalsTests
//
//  Created by sahebroy on 22/06/22.
//

import XCTest
@testable import iRentals

class LocalizationTests: XCTestCase {

    let locale = RentalLocalization()
    
    func testEnglishLocalisation() {
        BundleManager.shared.bundle = MockBundle().bundle
        locale.currentLanaguage = .english
        
        XCTAssertNotNil(locale)
        XCTAssertEqual(locale.mapViewTitle, "Map")
        XCTAssertEqual(locale.splashTitle, "iRentals")
        XCTAssertEqual(locale.listViewTitle, "Available Cars")
        XCTAssertEqual(locale.tabMapTitle, "Home")
        XCTAssertEqual(locale.tabListTitle, "List")
        XCTAssertEqual(locale.tabSettings, "Settings")
        XCTAssertEqual(locale.settingsLanguage, "Change Language")
        XCTAssertEqual(locale.carName, "Name")
        XCTAssertEqual(locale.carModel, "Model")
        XCTAssertEqual(locale.carTransmission, "Transmission")
        XCTAssertEqual(locale.carMake, "Make")
        XCTAssertEqual(locale.carColor, "Color")
        XCTAssertEqual(locale.carFuelType, "Fuel Type")
        XCTAssertEqual(locale.carFuelLevel, "Fuel Level")
        XCTAssertEqual(locale.carCleanStatus, "Cleanliness")
        XCTAssertEqual(locale.languageChangeAlert, "Do you want to change the language?")
        XCTAssertEqual(locale.noNetwork, "No Active Internet connection. Please try again later")
        XCTAssertEqual(locale.serverError, "We couldn't reach our servers. Do you want to retry?")
        XCTAssertEqual(locale.retry, "Retry")
        XCTAssertEqual(locale.alertOk, "Ok")
        XCTAssertEqual(locale.cancel, "Cancel")
        XCTAssertEqual(locale.error, "Error")
        XCTAssertEqual(locale.unknown, "Something went wrong. Please try again later")
        XCTAssertEqual(locale.carSeries, "Series")
        XCTAssertEqual(locale.carGroup, "Group")
        XCTAssertEqual(locale.carLicense, "License No.")
        XCTAssertEqual(locale.detailTitle, "Car Details")
        XCTAssertEqual(locale.refreshTitle, "Pull to refresh")
    }
    
    func testGermanLocalisation() {
        BundleManager.shared.bundle = MockBundle().bundle
        locale.currentLanaguage = .german
        XCTAssertNotNil(locale)
        XCTAssertEqual(locale.mapViewTitle, "Karte")
        XCTAssertEqual(locale.splashTitle, "iRentals")
        XCTAssertEqual(locale.listViewTitle, "Verfügbare Autos")
        XCTAssertEqual(locale.tabMapTitle, "Heim")
        XCTAssertEqual(locale.tabListTitle, "Aufführen")
        XCTAssertEqual(locale.tabSettings, "Einstellungen")
        XCTAssertEqual(locale.settingsLanguage, "Sprache ändern")
        XCTAssertEqual(locale.carName, "Name")
        XCTAssertEqual(locale.carModel, "Modell")
        XCTAssertEqual(locale.carTransmission, "Übertragung")
        XCTAssertEqual(locale.carMake, "Machen")
        XCTAssertEqual(locale.carColor, "Farbe")
        XCTAssertEqual(locale.carFuelType, "Treibstoffart")
        XCTAssertEqual(locale.carFuelLevel, "Tankfüllstand")
        XCTAssertEqual(locale.carCleanStatus, "Sauberkeit")
        XCTAssertEqual(locale.languageChangeAlert, "Möchten Sie die Sprache ändern?")
        XCTAssertEqual(locale.noNetwork, "Keine aktive Internetverbindung. Bitte versuchen Sie es später erneut")
        XCTAssertEqual(locale.serverError, "Wir konnten unsere Server nicht erreichen. Möchten Sie es erneut versuchen?")
        XCTAssertEqual(locale.retry, "Wiederholen")
        XCTAssertEqual(locale.alertOk, "Ok")
        XCTAssertEqual(locale.cancel, "Absagen")
        XCTAssertEqual(locale.error, "Fehler")
        XCTAssertEqual(locale.unknown, "Etwas ist schief gelaufen. Bitte versuchen Sie es später erneut")
        XCTAssertEqual(locale.carSeries, "Serie")
        XCTAssertEqual(locale.carGroup, "Gruppe")
        XCTAssertEqual(locale.carLicense, "Lizenznummer")
        XCTAssertEqual(locale.detailTitle, "Fahrzeugdetails")
        XCTAssertEqual(locale.refreshTitle, "Zum Aktualisieren ziehen")        
    }
    
    func testNoBundleAvailable() {
        BundleManager.shared.bundle = nil
        locale.currentLanaguage = .english
        XCTAssertNotEqual(locale.mapViewTitle, "Karte")
    }
    
    func testAllLanguages() {
        let allLangauges = locale.getAllLanguages()
        XCTAssertNotNil(allLangauges)
        XCTAssertEqual(allLangauges.count, 2)
        XCTAssertTrue(allLangauges.contains(where: {$0 == "en"}))
        XCTAssertTrue(allLangauges.contains(where: {$0 == "ge"}))
    }
    
}

class MockBundle {
    var bundle: Bundle {
        return Bundle(for: type(of: self))
    }
}

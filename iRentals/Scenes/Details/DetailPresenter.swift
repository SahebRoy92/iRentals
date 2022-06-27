//
//  DetailPresenter.swift
//  iRentals
//
//  Created by sahebroy on 26/06/22.
//

import Foundation

final class DetailPresenter: DetailPresenterRecieverProtocol {
    var title: String {
        localization.detailTitle
    }
    
    var selectedCar: Cars
    
    var localization: RentalLocalization {
       RentalAppManager.shared.localization
    }
    
    var make: String {
        "\(localization.carMake) - \(selectedCar.make)"
    }
    
    var model: String {
        "\(localization.carModel) - \(selectedCar.modelName)"
    }
    
    var name: String {
        "\(localization.carName) - \(selectedCar.name)"
    }
    
    var group: String {
        "\(localization.carGroup) - \(selectedCar.group)"
    }
    
    var color: String {
        "\(localization.carColor) - \(selectedCar.color)"
    }
    
    var series: String {
        "\(localization.carSeries) - \(selectedCar.series)"
    }
    
    var fType: String {
        "\(localization.carFuelType) - \(selectedCar.fuelType)"
    }
    
    var fLevel: String {
        "\(localization.carFuelLevel) - \(selectedCar.fuelLevel)"
    }
    
    var transmission: String {
        "\(localization.carTransmission) - \(selectedCar.transmission)"
    }
    
    var license: String {
        "\(localization.carLicense) - \(selectedCar.licensePlate)"
    }
    
    var clean: String {
        "\(localization.carCleanStatus) - \(selectedCar.innerCleanliness)"
    }
    
    var carImage: String {
        selectedCar.carImageUrl
    }

    init(_ car: Cars) {
        self.selectedCar = car
    }
}

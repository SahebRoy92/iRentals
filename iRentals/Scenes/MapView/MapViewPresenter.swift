//
//  MapViewPresenter.swift
//  iRentals
//
//  Created by sahebroy on 25/06/22.
//

import Foundation

final class MapViewPresenter: MapViewPresenterRecieverProtocol {
    var title: String {
        localization.mapViewTitle
    }
    
    var localization: LocalizationInterface {
        RentalAppManager.shared.localization
    }
    weak var controller: MapViewPresenterSenderProtocol?
    var interactor: MapViewInteractorRecieverProtocol
    
    init(_ interactor: MapViewInteractorRecieverProtocol) {
        self.interactor = interactor
    }
    
    func fetchAllCarsData() {
        interactor.fetchAllCars()
    }
    
    func fetchAnnotationDetailViewFor(_ carid: String, annotationView: AnnotationView) {
        if let car = interactor.getCarForid(carid) {
            annotationView.configureWith(car)
        }
    }
    
    func configurePin(_ car: Cars) -> CarAnnotation {
        let carPin = CarAnnotation.init()
        carPin.configureWithCar(car)
        return carPin
    }
}

extension MapViewPresenter: MapViewInteractorSenderProtocol {
    
    func carsFetchedSuccessfully(_ cars: [Cars]) {
        controller?.dataFetchedSuccessfully(cars)
    }
    
    func carsFetchFailed(_ error: String) {
        controller?.failedToFetchData(error)
    }
}

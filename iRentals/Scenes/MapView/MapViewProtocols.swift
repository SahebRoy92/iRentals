//
//  MapViewInterface.swift
//  iRentals
//
//  Created by sahebroy on 25/06/22.
//

import Foundation
import UIKit

protocol MapViewPresenterSenderProtocol: AnyObject {
    func dataFetchedSuccessfully(_ cars: [Cars])
    func failedToFetchData(_ error: String)
}

protocol MapViewPresenterRecieverProtocol {
    var title: String {get}
    var interactor: MapViewInteractorRecieverProtocol {get set}
    func fetchAllCarsData()
    func fetchAnnotationDetailViewFor(_ carid: String, annotationView: AnnotationView)
    func configurePin(_ car: Cars) -> CarAnnotation
}

protocol MapViewInteractorRecieverProtocol: FetchCarsImplementation {
    func getCarForid(_ id: String) -> Cars?
}

protocol MapViewInteractorSenderProtocol: RentalInteractorSenderProtocol {}

protocol MapViewRouterProtocol: RentalRouterPushToDetailProtocol {}

//
//  MapViewConfigurator.swift
//  iRentals
//
//  Created by sahebroy on 25/06/22.
//

import Foundation
import UIKit

final class MapViewConfigurator {
    static func configController() -> UIViewController {
        let interactor = MapViewInteractor.init(Network(), endpoint: Request.init(baseURL: Constants.URLs.baseURL, endpoint: Request.Endpoints.allCars.rawValue))
        let router = MapViewRouter()
        let presenter = MapViewPresenter.init(interactor)
        interactor.presenter = presenter
        let controller = MapViewController.init(presenter, router: router)
        presenter.controller = controller
        return controller
    }
}

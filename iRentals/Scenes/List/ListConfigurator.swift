//
//  ListConfigurator.swift
//  iRentals
//
//  Created by sahebroy on 26/06/22.
//

import Foundation
import UIKit

final class ListConfigurator {
    static func configController() -> UIViewController {
        let interactor = ListInteractor.init(Network(), endpoint: Request.init(baseURL: Constants.URLs.baseURL, endpoint: Request.Endpoints.allCars.rawValue))
        let presenter = ListPresenter.init(interactor)
        interactor.presenter = presenter
        let router = ListRouter()
        let controller = ListViewController.init(presenter, router: router)
        presenter.controller = controller
        return controller
    }
}

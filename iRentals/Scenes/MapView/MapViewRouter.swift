//
//  MapViewRouter.swift
//  iRentals
//
//  Created by sahebroy on 26/06/22.
//

import Foundation
import UIKit

final class MapViewRouter: MapViewRouterProtocol {
    
    func pushToDetail(_ selectedCar: Cars) -> UIViewController {
        DetailConfigurator.configureController(selectedCar)
    }
    
}

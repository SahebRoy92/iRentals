//
//  ListRouter.swift
//  iRentals
//
//  Created by sahebroy on 26/06/22.
//

import Foundation
import UIKit

final class ListRouter: ListRouterProtocol {
    
    func pushToDetail(_ selectedCar: Cars) -> UIViewController {
        DetailConfigurator.configureController(selectedCar)
    }
}

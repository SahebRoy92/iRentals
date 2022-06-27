//
//  DetailConfigurator.swift
//  iRentals
//
//  Created by sahebroy on 26/06/22.
//

import Foundation
import UIKit

final class DetailConfigurator {
    
    static func configureController(_ selectedCar: Cars) -> UIViewController {
        let presenter = DetailPresenter.init(selectedCar)
        let controller = DetailViewController.init(presenter)
        return controller
    }
}

//
//  CommonProtocols.swift
//  iRentals
//
//  Created by sahebroy on 26/06/22.
//

import Foundation
import UIKit

protocol RentalInteractorSenderProtocol: AnyObject {
    func carsFetchedSuccessfully(_ cars: [Cars])
    func carsFetchFailed(_ error: String)
}

protocol RentalRouterPushToDetailProtocol {
    func pushToDetail(_ selectedCar: Cars) -> UIViewController
}

protocol RentalFetchCarsFromNetworkProtocol {
    var service: Network {get set}
    var endpoint: Request {get set}
    func fetchAllCars()
}

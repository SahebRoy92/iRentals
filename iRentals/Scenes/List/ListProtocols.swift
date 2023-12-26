//
//  ListProtocols.swift
//  iRentals
//
//  Created by sahebroy on 26/06/22.
//

import Foundation
import UIKit

protocol ListPresenterRecieverProtocol {
    var title: String {get}
    var refreshTitle: String {get}
    var interactor: ListInteractorRecieverProtocol {get set}
    
    func fetchAllCars()
    func configureCellWithCar(_ cell: ListTableViewCell, index: Int)
    func didSelectAtIndex(_ index: Int) -> Cars?
    
    func numberOfRows() -> Int
    func numberOfSection() -> Int
}

protocol ListPresenterSenderProtocol: AnyObject {
    func didFinishFetchingData()
    func didFailedToFetchData(_ error: String)
}

protocol ListInteractorRecieverProtocol: FetchCarsImplementation {
    func getCarAtIndex(_ int: Int) -> Cars?
}

protocol ListInteractorSenderProtocol: RentalInteractorSenderProtocol {}

protocol ListRouterProtocol: RentalRouterPushToDetailProtocol {}

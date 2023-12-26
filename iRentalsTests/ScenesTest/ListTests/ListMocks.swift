//
//  ListMocks.swift
//  iRentalsTests
//
//  Created by sahebroy on 26/06/22.
//

import Foundation
import UIKit
@testable import iRentals

class ListMockViewController: ListPresenterSenderProtocol {
    
    var successfullyFetched = false
    var errorWhileFetching = false
    
    func didFinishFetchingData() {
        successfullyFetched = true
        errorWhileFetching = false
    }
    
    func didFailedToFetchData(_ error: String) {
        errorWhileFetching = true
        successfullyFetched = false
    }
}

class ListMockRouter: ListRouterProtocol {
    var didPush = false
    func pushToDetail(_ selectedCar: Cars) -> UIViewController {
        didPush = true
        return UIViewController()
    }
}

class ListMockInteractor: FetchCarsImplementation {
    init(_ cars: [Cars]?) {
        super.init(Network(), endpoint: Request.init(baseURL: "", endpoint: ""))
        self.allCars = cars
    }
    
    override func fetchAllCars() {
        if let hasCars = self.allCars {
            self.presenter?.carsFetchedSuccessfully(hasCars)
        } else {
            self.presenter?.carsFetchFailed("error")
        }
    }
}

extension ListMockInteractor: ListInteractorRecieverProtocol {
    func getCarAtIndex(_ int: Int) -> Cars? {
        return allCars?[int]
    }
}

class ListMockPresenter: ListPresenterRecieverProtocol {
    var title: String = "title"
    var refreshTitle: String = "Refresh"
    var interactor: ListInteractorRecieverProtocol
    var fetchedCar = false
    var configured = false
    var allCars: [Cars]
    weak var controller: ListPresenterSenderProtocol?
    
    init(_ interactor: ListInteractorRecieverProtocol, cars: [Cars]) {
        self.interactor = interactor
        self.allCars = cars
    }
    
    func fetchAllCars() {
        controller?.didFinishFetchingData()
    }
    
    func configureCellWithCar(_ cell: ListTableViewCell, index: Int) {
        configured = true
    }
    
    func didSelectAtIndex(_ index: Int) -> Cars? {
        allCars[index]
    }
    
    func numberOfRows() -> Int {
        return 1
    }
    
    func numberOfSection() -> Int {
        return 1
    }
    
}

extension ListMockPresenter: ListInteractorSenderProtocol {
    func carsFetchedSuccessfully(_ cars: [Cars]) {
        fetchedCar = true
    }
    
    func carsFetchFailed(_ error: String) {
        fetchedCar = false
    }
}

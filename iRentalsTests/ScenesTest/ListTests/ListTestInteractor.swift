//
//  ListTestInteractor.swift
//  iRentalsTests
//
//  Created by sahebroy on 27/06/22.
//

import XCTest
@testable import iRentals

class ListTestInteractor: XCTestCase {

    let network = Network()
    let req = Request.init(baseURL: "", endpoint: "")
    var interactor: ListInteractor?
    var allCars: [Cars]?
    var presenter: ListMockPresenter?
    
    func testInteractorFetchAtIndex() {
        commonInit()
       let noModel = interactor?.getCarAtIndex(0)
       XCTAssertNil(noModel)
    }
    
    func commonInit() {
        interactor = ListInteractor.init(network, endpoint: req)
        let mockData = MockDataLoader()
        guard let allMockData = mockData.loadFromMockBundle("mockdata") else {
            XCTFail("Couldnt Load mock data from json file!")
            return
        }
        guard let allCars = network.parseResponse(data: allMockData) else {return}
        self.allCars = allCars
        
        presenter = ListMockPresenter.init(interactor!, cars: allCars)
        interactor?.presenter = presenter

    }

}

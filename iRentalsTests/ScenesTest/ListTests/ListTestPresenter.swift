//
//  ListTestPresenter.swift
//  iRentalsTests
//
//  Created by sahebroy on 26/06/22.
//

import XCTest
@testable import iRentals

class ListTestPresenter: XCTestCase {
    
    let controller = ListMockViewController()
    let network = Network()
    var presenter: ListPresenter?
    var interactor: ListMockInteractor?
    var allCars: [Cars]?
    let mockData = MockDataLoader()
    
    override func setUp() {
        commonInit()
    }
    
    func commonInit() {
        guard let allMockData = mockData.loadFromMockBundle("mockdata") else {
            XCTFail("Couldnt Load mock data from json file!")
            return
        }
        guard let allCars = network.parseResponse(data: allMockData) else {return}
        self.allCars = allCars
        interactor = ListMockInteractor.init(allCars)
        presenter = ListPresenter.init(interactor!)
        presenter!.controller = controller
        interactor!.presenter = presenter
    }
    
    func initFailedCars() {
        interactor = ListMockInteractor.init(nil)
        presenter = ListPresenter.init(interactor!)
        presenter!.controller = controller
        interactor!.presenter = presenter
    }
    
    func testListStrings() {
        let locale = RentalLocalization()
        BundleManager.shared.bundle = MockBundle().bundle
        locale.currentLanaguage = .english
        XCTAssertEqual(presenter?.title, locale.listViewTitle)
        XCTAssertEqual(presenter?.refreshTitle, locale.refreshTitle)
    }

    func testPresenterTableViewFunctions() {
        let cell = ListTableViewCell.init(style: .default, reuseIdentifier: ListTableViewCell.reuse)
        presenter?.configureCellWithCar(cell, index: 0)
        XCTAssertNotNil(cell)
        
        XCTAssertEqual(presenter?.numberOfRows(), self.allCars?.count)
        XCTAssertEqual(presenter?.numberOfSection(), 1)
        
    }
    
    func testConfiguration() {
        commonInit()
        XCTAssertNotNil(interactor)
        
        XCTAssertNotNil(presenter)
        XCTAssertNotNil(presenter?.controller)
        XCTAssertNotNil(presenter?.interactor)
    }
    
    func testFetchCars() {
        commonInit()
        presenter?.fetchAllCars()
        XCTAssertTrue(controller.successfullyFetched)
    }
    
    func testFailedCars() {
        initFailedCars()
        presenter?.fetchAllCars()
        XCTAssertTrue(controller.errorWhileFetching)
    }
    
    func testDidSelect() {
        let car = presenter?.didSelectAtIndex(5)
        XCTAssertNotNil(car)
        XCTAssertEqual(car, allCars?[5])
    }
    
}

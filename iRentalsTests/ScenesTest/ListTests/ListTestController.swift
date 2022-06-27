//
//  ListTestController.swift
//  iRentalsTests
//
//  Created by sahebroy on 27/06/22.
//

import XCTest
@testable import iRentals

class ListTestController: XCTestCase {
    var allCars: [Cars]?
    var controller: ListViewController?
    var mockPresenter: ListMockPresenter?
    let mockRouter = ListMockRouter()
    let mockData = MockDataLoader()
    var mockInteractor: ListMockInteractor?
    
    override func setUp() {
        configure()
    }
    
    func configure() {
        let network = Network()
        guard let allMockData = mockData.loadFromMockBundle("mockdata") else {
            XCTFail("Couldnt Load mock data from json file!")
            return
        }
        guard let allCars = network.parseResponse(data: allMockData) else {return}
        self.allCars = allCars
        mockInteractor = ListMockInteractor.init(allCars)
        mockPresenter = ListMockPresenter.init(mockInteractor!, cars: allCars)
        mockInteractor?.presenter = mockPresenter
        controller = ListViewController.init(mockPresenter!, router: mockRouter)
        mockPresenter?.controller = controller
    }
    
    func testControllerConfig() {
        XCTAssertNotNil(controller?.presenter)
        XCTAssertNotNil(controller?.viewDidLoad())
    }
    
    func testControllerFetchedData() {
        mockInteractor?.fetchAllCars()
        XCTAssertTrue(mockPresenter!.fetchedCar)
    }
    
    func testControllerTableView() {
        let mockTable = UITableView()
        mockTable.dataSource = controller
        mockTable.delegate = controller
        mockTable.register(ListTableViewCell.self, forCellReuseIdentifier: ListTableViewCell.reuse)
        let cell = controller?.tableView(mockTable, cellForRowAt: IndexPath.init(row: 0, section: 0))
        XCTAssertNotNil(cell)
        
        controller?.tableView(mockTable, didSelectRowAt: IndexPath.init(row: 0, section: 0))
        XCTAssertTrue(mockRouter.didPush)
        
        let height = controller?.tableView(mockTable, heightForRowAt: IndexPath.init(row: 0, section: 0))
        XCTAssertEqual(height, UITableView.automaticDimension)
    }
}

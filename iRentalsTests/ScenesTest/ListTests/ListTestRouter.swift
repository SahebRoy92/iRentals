//
//  ListTestRouter.swift
//  iRentalsTests
//
//  Created by sahebroy on 27/06/22.
//

import XCTest
@testable import iRentals

class ListTestRouter: XCTestCase {

    func testRouterPush() {
        let mockData = MockDataLoader()
        let network = Network()
        guard let allMockData = mockData.loadFromMockBundle("mockdata") else {
            XCTFail("Couldnt Load mock data from json file!")
            return
        }
        guard let allCars = network.parseResponse(data: allMockData) else {return}
        let router = ListRouter()
        XCTAssertNotNil(allCars)
        guard let first = allCars.first else {
            XCTFail("No car found --- ")
            return
        }
        XCTAssertNotNil(router.pushToDetail(first))
    }
    
}

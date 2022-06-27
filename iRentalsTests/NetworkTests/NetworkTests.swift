//
//  NetworkTests.swift
//  iRentalsTests
//
//  Created by sahebroy on 23/06/22.
//

import XCTest
@testable import iRentals

class NetworkTests: XCTestCase {
    let service = Network()
    let endpoint = Request.init(baseURL: "https://cdn.sixt.io/", endpoint: Request.Endpoints.allCars.rawValue)
    
    func testURLRequest() {
        let request = service.makeRequest(from: endpoint)
        XCTAssertNotNil(request)
        XCTAssertEqual(request?.url?.scheme, "https")
        XCTAssertEqual(request?.url?.host, "cdn.sixt.io")
    }
    
    func testResponse() {
        let mockData = MockDataLoader()
        guard let allMockData = mockData.loadFromMockBundle("mockdata") else {
            XCTFail("Couldnt Load mock data from json file!")
            return
        }
        let allCars = service.parseResponse(data: allMockData)
        XCTAssertNotNil(allCars)
    }
    
    func testInvalidResponse() {
        let invalidJson = "[\"invalidData\" : \"data\"]"
        let data = invalidJson.data(using: .utf8)!
        let allCars = service.parseResponse(data: data)
        XCTAssertNil(allCars)
    }
    
    func testNetworkClientSuccess() {
        let client = NetworkClient.init(request: service)
        let expectation = self.expectation(description: "performing network call--")
        client.fetch(endpoint) { result in
            switch result {
                case .success(let cars):
                    expectation.fulfill()
                    XCTAssertNotNil(cars)
                case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        self.wait(for: [expectation], timeout: 5.0)
    }
    
    func testNetworkClientFailure() {
        let client = NetworkClient.init(request: service)
        let failureEndpoint = Request.init(baseURL: "", endpoint: "")
        let expectation = self.expectation(description: "performing network call--")
        client.fetch(failureEndpoint) { result in
            switch result {
                case .success(let cars):
                    XCTFail("This shouldn't be called ---\(cars.count) ")
                case .failure(let error):
                    expectation.fulfill()
                    XCTAssertNotNil(error)
            }
        }
        self.wait(for: [expectation], timeout: 5.0)
    }
}

class MockDataLoader {
    func loadFromMockBundle(_ fileName: String) -> Data? {
        let mockBundle = MockBundle()
        if let url = mockBundle.bundle.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                return data
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
}

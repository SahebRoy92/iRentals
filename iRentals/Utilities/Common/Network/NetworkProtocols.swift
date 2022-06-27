//
//  Network.swift
//  iRentals
//
//  Created by sahebroy on 22/06/22.
//

import Foundation

struct Request {
    let baseURL: String
    let endpoint: String
    
    enum Endpoints: String {
        case allCars = "codingtask/cars"
    }
}

extension Request {
    func getFullURL() -> String {
        return baseURL + endpoint
    }
}

protocol APIRequest {
    associatedtype RequestDataType
    associatedtype ResponseDataType
    func makeRequest(from data: RequestDataType) -> URLRequest?
    func parseResponse(data: Data) -> ResponseDataType?
}

enum NetworkError: Error {
    case noNetwork
    case parsingError
    case serverError
    case unknown
    case wrongURL
}

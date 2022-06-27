//
//  FetchCarsImplementation.swift
//  iRentals
//
//  Created by sahebroy on 26/06/22.
//

import Foundation

class FetchCarsImplementation: RentalFetchCarsFromNetworkProtocol {
    
    var service: Network
    var endpoint: Request
    weak var presenter: RentalInteractorSenderProtocol?
    internal var allCars: [Cars]?
    
    init(_ service: Network, endpoint: Request) {
        self.service = service
        self.endpoint = endpoint
    }

    func fetchAllCars() {
        let client = NetworkClient.init(request: service)
        client.fetch(endpoint) { result in
            switch result {
                case .failure(let error):
                    self.presenter?.carsFetchFailed(error.localizedDescription)
                case .success(let resultCars):
                    self.allCars = resultCars
                    self.presenter?.carsFetchedSuccessfully(resultCars)
            }
        }
    }
}

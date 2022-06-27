//
//  ListInteractor.swift
//  iRentals
//
//  Created by sahebroy on 26/06/22.
//

import Foundation

final class ListInteractor: FetchCarsImplementation {}

extension ListInteractor: ListInteractorRecieverProtocol {
    func getCarAtIndex(_ int: Int) -> Cars? {
        if let carModel = self.allCars {
            return carModel[int]
        }
        return nil
    }
}

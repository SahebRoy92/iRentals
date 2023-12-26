//
//  MapViewInteractor.swift
//  iRentals
//
//  Created by sahebroy on 25/06/22.
//

import Foundation

final class MapViewInteractor: FetchCarsImplementation {

}

extension MapViewInteractor: MapViewInteractorRecieverProtocol {
    func getCarForid(_ id: String) -> Cars? {
        self.allCars?.filter({$0.id == id}).first
    }
}

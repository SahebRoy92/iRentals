//
//  CarAnnotations.swift
//  iRentals
//
//  Created by sahebroy on 25/06/22.
//

import Foundation
import MapKit

class CarAnnotation: MKPointAnnotation {
    var car: Cars?
    
    func configureWithCar(_ car: Cars) {
        self.car = car
        title = car.name
        subtitle = "\(car.make) - \(car.modelName)"
        coordinate = CLLocationCoordinate2D.init(latitude: car.latitude, longitude: car.longitude)
    }
}

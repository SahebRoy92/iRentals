//
//  Cars.swift
//  iRentals
//
//  Created by sahebroy on 22/06/22.
//

import Foundation

struct Cars: Codable, Equatable {
    
    let id: String
    let modelIdentifier: String
    let modelName: String
    let name: String
    let make: String
    let group: String
    let color: String
    let series: String
    let fuelType: String
    let fuelLevel: Double
    let transmission: String
    let licensePlate: String
    let latitude: Double
    let longitude: Double
    let innerCleanliness: String
    let carImageUrl: String
}

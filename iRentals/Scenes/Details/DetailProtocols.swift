//
//  DetailProtocols.swift
//  iRentals
//
//  Created by sahebroy on 26/06/22.
//

import Foundation

protocol DetailPresenterRecieverProtocol {
    var selectedCar: Cars {get set}
    var title: String {get}
    var make: String {get}
    var model: String {get}
    var name: String {get}
    var group: String {get}
    var color: String {get}
    var series: String {get}
    var fType: String {get}
    var fLevel: String {get}
    var transmission: String {get}
    var license: String {get}
    var clean: String {get}
    var carImage: String {get}
}

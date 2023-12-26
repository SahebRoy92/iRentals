//
//  ListPresenter.swift
//  iRentals
//
//  Created by sahebroy on 26/06/22.
//

import Foundation

final class ListPresenter: ListPresenterRecieverProtocol {
    
    var interactor: ListInteractorRecieverProtocol
    
    var title: String {
        localization.listViewTitle
    }
    
    var refreshTitle: String {
        localization.refreshTitle
    }
    
    var localization: LocalizationInterface {
        RentalAppManager.shared.localization
    }
    
    weak var controller: ListPresenterSenderProtocol?
        
    init(_ interactor: ListInteractorRecieverProtocol) {
        self.interactor = interactor
    }
    
    func fetchAllCars() {
        self.interactor.fetchAllCars()
    }
    
    func configureCellWithCar(_ cell: ListTableViewCell, index: Int) {
        if let model = interactor.getCarAtIndex(index) {
            cell.configureWith(model.name, subTitle: "\(model.make) - \(model.modelName)", mainImage: model.carImageUrl)
        }
    }
    
    func didSelectAtIndex(_ index: Int) -> Cars? {
        interactor.getCarAtIndex(index)
    }
    
    func numberOfRows() -> Int {
        return interactor.allCars?.count ?? 0
    }
    
    func numberOfSection() -> Int {
        return 1
    }
}

extension ListPresenter: ListInteractorSenderProtocol {
    func carsFetchedSuccessfully(_ cars: [Cars]) {
        self.controller?.didFinishFetchingData()
    }
    
    func carsFetchFailed(_ error: String) {
        self.controller?.didFailedToFetchData(error)
    }
}

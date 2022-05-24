//
//  DetailVCPresenter.swift
//  Hotels Information
//
//  Created by User on 09.05.2022.
//

import Foundation


final class DetailPresenter: DetailPresenterProtocolOutput {
    weak var view: DetailViewProtocolInput?
    let networkService: NetworkManagerProtocol!
    var router: RouterProtocol
    var modelInfo: HotelModel?
    var modelImage: HotelPhotoModel?
    
    required init(view: DetailViewProtocolInput, networkService: NetworkManagerProtocol, dataHotel: HotelModel, imageHotel: HotelPhotoModel, router: RouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.modelInfo = dataHotel
        self.modelImage = imageHotel
        self.router = router
        setData()
    }
    
     private func setData() {
        guard let modelInfo = modelInfo else { return }
        guard let modelImage = modelImage else { return }
        
        self.view?.getData(dataHotel: modelInfo, imageHotel: modelImage)
    }
}

//
//  HotelPresenter.swift
//  Hotels Information
//
//  Created by User on 09.05.2022.
//

import UIKit

final class HotelPresenter: HotelPresenterOutputProtocol{
    weak var view: HotelVCProtocolInput?
    let networkService: NetworkManagerProtocol!
    var router: RouterProtocol?
    var modelInfo: [HotelModel]?
    var modelImage: [HotelPhotoModel]?

    required init(view: HotelVCProtocolInput, networkService: NetworkManagerProtocol, router: RouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.router = router
        getData()
    }
    func getData() {
        networkService.fetchData { [ weak self ] result in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                switch result{
                case .success(let dataModel):
                    self.modelInfo = dataModel
                    self.view?.success()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
        self.networkService.fetchPhoto { [ weak self ]  photoModel in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.modelImage = photoModel
                self.view?.success()
            }
        }
    }
    func tapOnTheData(modelInfo: HotelModel, modelImage: HotelPhotoModel) {
        router?.showDetail(dataHotel: modelInfo, imageHotel: modelImage)
    }
}

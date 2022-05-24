//
//  HotelPresenterProtocol.swift
//  Hotels Information
//
//  Created by User on 09.05.2022.
//

import Foundation

protocol HotelPresenterOutputProtocol: AnyObject {
    var modelInfo: [HotelModel]? { get set }
    var modelImage: [HotelPhotoModel]? { get set }
    
    init(view: HotelVCProtocolInput, networkService: NetworkManagerProtocol, router: RouterProtocol)
    func tapOnTheData(modelInfo: HotelModel, modelImage: HotelPhotoModel)
}

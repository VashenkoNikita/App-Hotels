//
//  DetailPresenterProtocolOutput.swift
//  Hotels Information
//
//  Created by User on 09.05.2022.
//

import Foundation

protocol DetailPresenterProtocolOutput: AnyObject {
    
    init(view: DetailViewProtocolInput, networkService: NetworkManagerProtocol, dataHotel: HotelModel, imageHotel: HotelPhotoModel)
    
    func setData()
}

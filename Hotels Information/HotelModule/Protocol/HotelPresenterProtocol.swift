//
//  HotelPresenterProtocol.swift
//  Hotels Information
//
//  Created by User on 09.05.2022.
//

import Foundation

protocol HotelPresenterOutputProtocol: AnyObject {
    init(view: HotelVCProtocolInput, networkService: NetworkManagerProtocol)
    
    func getData()
    
    var modelInfo: [HotelModel]? { get set }
    var modelImage: [HotelPhotoModel]? { get set }
}

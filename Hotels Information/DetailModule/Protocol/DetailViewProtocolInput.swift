//
//  DetailViewProtocolInput.swift
//  Hotels Information
//
//  Created by User on 09.05.2022.
//

import Foundation

protocol DetailViewProtocolInput: AnyObject {
    
    func getData(dataHotel: HotelModel, imageHotel: HotelPhotoModel)
}

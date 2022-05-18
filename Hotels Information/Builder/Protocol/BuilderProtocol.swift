//
//  BuilderProtocol.swift
//  Hotels Information
//
//  Created by User on 09.05.2022.
//

import UIKit

protocol Builder {
    
    static func createHotelModule() -> UIViewController
    static func createDetailModule(dataHotel: HotelModel, imageHotel: HotelPhotoModel) -> UIViewController
}

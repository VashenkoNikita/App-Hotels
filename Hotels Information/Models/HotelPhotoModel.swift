//
//  HotelPhoto.swift
//  Hotels Information
//
//  Created by User on 08.05.2022.
//

import Foundation

struct HotelPhotoModel: Decodable {
    
    var name: String
    var hotelPhoto: String
    var id: Int
 
    func contains(filter:String?) -> Bool{
        guard let filter = filter else { return true }
        if filter.isEmpty { return true}
        let lowercasedFiler = filter.lowercased()
        return name.lowercased().contains(lowercasedFiler)
    }
}

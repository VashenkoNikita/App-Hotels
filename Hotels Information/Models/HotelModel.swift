//
//  HotelModel.swift
//  Hotels Information
//
//  Created by User on 08.05.2022.
//

import UIKit

struct HotelModel: Decodable {
    
    var id: Int
    var name: String
    var address: String
    var stars: Double
    var distance: Double
    var suites_availability: String
    
    func contains(filter:String?) -> Bool{
        guard let filter = filter else { return true }
        if filter.isEmpty { return true}
        let lowercasedFiler = filter.lowercased()
        
        return name.lowercased().contains(lowercasedFiler)
    }
}

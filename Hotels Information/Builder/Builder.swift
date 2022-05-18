//
//  Builder.swift
//  Hotels Information
//
//  Created by User on 09.05.2022.
//

import UIKit

final class ModuleBuilder: Builder{
    
    static func createHotelModule() -> UIViewController {
        let view = HotelViewController()
        let networkManager = NetworkManager()
        
        let presenter = HotelPresenter(view: view, networkService: networkManager)
        view.presenter = presenter
        
        return view
    }
    
    static func createDetailModule(dataHotel: HotelModel, imageHotel: HotelPhotoModel) -> UIViewController {
        let view = DetailInfoHotelVC()
        let networkManager = NetworkManager()
        
        let presenter = DetailPresenter(view: view, networkService: networkManager, dataHotel: dataHotel, imageHotel: imageHotel)
        view.presenter = presenter
        
        return view
    }
}

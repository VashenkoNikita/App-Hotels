//
//  AssemblyModuleBuilder.swift
//  Hotels Information
//
//  Created by User on 09.05.2022.
//

import UIKit

protocol AssemblyBuilderProtocol {
    
    func createHotelModule(router: RouterProtocol) -> UIViewController
    func createDetailModule(dataHotel: HotelModel, imageHotel: HotelPhotoModel, router: RouterProtocol) -> UIViewController
}

final class AssemblyModuleBuilder: AssemblyBuilderProtocol{
    func createHotelModule(router: RouterProtocol) -> UIViewController {
        let view = HotelViewController()
        let networkManager = NetworkManager()
        
        let presenter = HotelPresenter(view: view, networkService: networkManager, router: router)
        view.presenter = presenter
        
        return view
    }
    
    func createDetailModule(dataHotel: HotelModel, imageHotel: HotelPhotoModel, router: RouterProtocol) -> UIViewController {
        let view = DetailInfoHotelVC()
        let networkManager = NetworkManager()
        
        let presenter = DetailPresenter(view: view, networkService: networkManager, dataHotel: dataHotel, imageHotel: imageHotel, router: router)
        view.presenter = presenter
        
        return view
    }
    

}

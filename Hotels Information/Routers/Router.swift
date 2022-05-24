//
//  Router.swift
//  Hotels Information
//
//  Created by User on 23.05.2022.
//

import UIKit

protocol RouterProtocolMain {
    var navigationController: UINavigationController? { get set }
    var assemblyBuilder: AssemblyBuilderProtocol? { get set }
}

protocol RouterProtocol: RouterProtocolMain {
    func initialViewController()
    func showDetail(dataHotel: HotelModel, imageHotel: HotelPhotoModel)
}

class Router: RouterProtocol {
    var navigationController: UINavigationController?
    var assemblyBuilder: AssemblyBuilderProtocol?
    
    init(navigationController: UINavigationController, assemblyBuilder: AssemblyBuilderProtocol ) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }
    
    func initialViewController() {
        if let navigationController = navigationController {
            guard let mainViewController = assemblyBuilder?.createHotelModule(router: self) else { return }
            navigationController.viewControllers = [mainViewController]
        }
    }
    
    func showDetail(dataHotel: HotelModel, imageHotel: HotelPhotoModel) {
        if let navigationController = navigationController {
            guard let detailViewController = assemblyBuilder?.createDetailModule(dataHotel: dataHotel, imageHotel: imageHotel, router: self) else { return }
            navigationController.pushViewController(detailViewController, animated: true)
        }
    }
}

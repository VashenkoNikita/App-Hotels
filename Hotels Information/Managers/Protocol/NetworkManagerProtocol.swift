//
//  NetworkManagerProtocol.swift
//  Hotels Information
//
//  Created by User on 09.05.2022.
//

import Foundation

protocol NetworkManagerProtocol{
    func fetchData(comletion:@escaping (Result<[HotelModel]?, Error>) -> Void)
    func fetchPhoto(comletion: @escaping ([HotelPhotoModel]) -> Void)
}

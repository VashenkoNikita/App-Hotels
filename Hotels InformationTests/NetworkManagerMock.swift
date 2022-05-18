//
//  NetworkManagerMock.swift
//  Hotels InformationTests
//
//  Created by User on 09.05.2022.
//

import Foundation
@testable import Hotels_Information

final class NetworkManagerMock: NetworkManagerProtocol {
    
    var fetchToCalledData: Bool = false
    var fetchToCalledPhoto: Bool = false
    
    func fetchData(comletion: @escaping (Result<[HotelModel]?, Error>) -> Void) {
        fetchToCalledData = true
    }
    
    func fetchPhoto(comletion: @escaping ([HotelPhotoModel]) -> Void) {
        fetchToCalledPhoto = true
    }
        
}

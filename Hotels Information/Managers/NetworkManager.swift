//
//  NetworkManager.swift
//  Hotels Information
//
//  Created by User on 08.05.2022.
//

import Foundation

final class NetworkManager: NetworkManagerProtocol{
    
    func fetchData(comletion:@escaping (Result<[HotelModel]?, Error>) -> Void){
        let urlString = "https://bitbucket.org/instadevteam/tests/raw/63a9ecea18ca79c275a2eeafd95bc37f857cf2ec/1.2/0777.json"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask (with: url) { data, responce, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let object = try JSONDecoder().decode ([HotelModel].self, from: data)
                comletion(.success(object))
            } catch  {
                comletion(.failure(error))
            }
        }.resume()
        
    }
    func fetchPhoto(comletion: @escaping ([HotelPhotoModel]) -> Void) {
        let modelData = Bundle.main.decode([HotelPhotoModel].self, from: "hotelimage.json")
        
        comletion(modelData)
    }
  
}



//
//  BundleExtansion.swift
//  Hotels Information
//
//  Created by User on 08.05.2022.
//

import Foundation

extension Bundle{
    
    func decode <T: Decodable> (_ type:T.Type, from file:String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {fatalError("Url failed")}
        guard let data = try? Data(contentsOf: url) else {fatalError("Data failed")}
        
        let decoder = JSONDecoder()
        guard let loaded = try? decoder.decode(T.self, from: data) else {fatalError("Loaded failde")}
        
        return loaded
    }
}

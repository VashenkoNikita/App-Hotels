//
//  HotelProtocolVC.swift
//  Hotels Information
//
//  Created by User on 09.05.2022.
//

import Foundation

protocol HotelVCProtocolInput: AnyObject {
    func success()
    func failure(error: Error)
}

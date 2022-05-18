//
//  ViewMock.swift
//  Hotels InformationTests
//
//  Created by User on 09.05.2022.
//

import Foundation
@testable import Hotels_Information

final class ViewMock: HotelVCProtocolInput {
    var successCall: Bool = false
    var failureCall: Bool = false
    
    func success() {
        successCall = true
    }
    
    func failure(error: Error) {
        failureCall = true
    }
        
}


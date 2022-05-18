//
//  Hotels_InformationTests.swift
//  Hotels InformationTests
//
//  Created by User on 09.05.2022.
//

import XCTest
@testable import Hotels_Information

class Hotels_InformationTests: XCTestCase {
    var sut: HotelPresenter!
    var view: ViewMock!
    var netManager: NetworkManagerMock!

    override func setUpWithError() throws {
        
        view = ViewMock()
        netManager = NetworkManagerMock()
        sut = HotelPresenter(view: view, networkService: netManager)
    }

    override func tearDownWithError() throws {
        view = nil
        netManager = nil
        sut = nil
    }
 
    func testNetManagerIsCalledSuccess() {
        
        sut.getData()
        XCTAssert(netManager.fetchToCalledData)
        XCTAssert(netManager.fetchToCalledPhoto)
        
    }
}

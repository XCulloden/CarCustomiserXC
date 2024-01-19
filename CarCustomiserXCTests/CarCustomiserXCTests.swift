//
//  CarCustomiserXCTests.swift
//  CarCustomiserXCTests
//
//  Created by xan culloden on 18/01/2024.
//

import XCTest
@testable import CarCustomiserXC

final class CarCustomiserXCTests: XCTestCase {
    
    func testNewCarGivesMeCarWithAllAttributesSet() {
        //arrange
        //act
        let car = Car(make: "Mazda",model: "MX-5", topSpeed: 125, acceleration: 7.7, handling: 5)
        let stats = Car.displayStats(<#T##self: Car##Car#>)
        //assert
        XCTAssertEqual(car.make, "Mazda")
        XCTAssertEqual(car.model, "MX-5")
        XCTAssertEqual(car.topSpeed, 125)
        XCTAssertEqual(car.acceleration, 7.7)
        XCTAssertEqual(car.handling, 5)
        XCTAssertEqual(stats(), String())
    }
}

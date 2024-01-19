//
//  Car.swift
//  CarCustomiserXC
//
//  Created by xan culloden on 19/01/2024.
//

import Foundation

struct Car{
    let make: String
    let model: String
    var topSpeed: Int
    var acceleration: Double
    var handling: Int
    
    func displayStats() -> String {
        return(" Make: \(self.make) \n Model: \(self.model) \n Top speed: \(self.topSpeed) \n Acceleration: \(self.acceleration) \n Handling: \(self.handling)")
    }
}

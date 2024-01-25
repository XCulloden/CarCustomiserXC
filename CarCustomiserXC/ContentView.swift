//
//  ContentView.swift
//  CarCustomiserXC
//
//  Created by xan culloden on 18/01/2024.
//

import SwiftUI

struct ContentView: View {
    @State var starterCars = StarterCars()
    @State private var selectedCar: Int = 0 {
        didSet {
            if selectedCar >= starterCars.cars.count {
                selectedCar = 0
            }
            
        }
    }
    
    @State private var exhaustPackage = false
    @State private var tiresPackage = false
    @State private var ecuFuelPackage = false
    @State private var driveTrainPackage = false
    @State private var remainingFunds = 1000
    @State private var lowTierFunds = true
    @State private var highTierFunds = true
    
    
    var body: some View {
        let exhaustPackageBinding = Binding<Bool> (
            get: { self.exhaustPackage },
            set: { newValue in
                self.exhaustPackage = newValue
                if newValue {
                    starterCars.cars[selectedCar].topSpeed += 5
                    remainingFunds -= 500
                } else {
                    starterCars.cars[selectedCar].topSpeed -= 5
                    remainingFunds += 500
                }
            }
        )
        
        
        let ecuFuelPackageBinding = Binding<Bool> (
            get: { self.ecuFuelPackage },
            set: { newValue in
                self.ecuFuelPackage = newValue
                if newValue {
                    starterCars.cars[selectedCar].topSpeed += 3
                    starterCars.cars[selectedCar].acceleration -= 1.5
                    remainingFunds -= 500
                } else {
                    starterCars.cars[selectedCar].topSpeed -= 3
                    starterCars.cars[selectedCar].acceleration = 1.5
                    remainingFunds += 500
                }
            }
        )
        let tiresPackageBinding = Binding<Bool> (
            get: { self.tiresPackage },
            set: { newValue in
                self.tiresPackage = newValue
                if newValue {
                    starterCars.cars[selectedCar].handling += 2
                    starterCars.cars[selectedCar].acceleration -= 1.5
                    remainingFunds -= 500
                } else {
                    starterCars.cars[selectedCar].handling -= 2
                    starterCars.cars[selectedCar].acceleration += 1.5
                    remainingFunds += 500
                }
            }
        )
        let driveTrainPackageBinding = Binding<Bool> (
            get: { self.driveTrainPackage },
            set: { newValue in
                self.driveTrainPackage = newValue
                if newValue {
                    starterCars.cars[selectedCar].acceleration -= 1.5
                    remainingFunds -= 1000
                } else {
                    starterCars.cars[selectedCar].acceleration += 1.5
                    remainingFunds += 1000
                }
            }
        )
        
        VStack{
            Form {
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text(starterCars.cars[selectedCar].displayStats())
                    Button("Next Car", action: {
                        resetDisplay()
                        selectedCar += 1
                    })
                }
            }
            Section {
                Toggle("Exhaust Package (Cost: 500)", isOn: exhaustPackageBinding)
                Toggle("Tires Package (Cost: 500)", isOn: tiresPackageBinding)
                Toggle("Ecu Fuel Package (Cost: 500)", isOn: ecuFuelPackageBinding)
                Toggle("Drive Train Package (Cost: 1000)", isOn: driveTrainPackageBinding)
                
            }
            Text("Remaining funds: \(remainingFunds)")
        }
    }
    
    func resetDisplay () {
        exhaustPackage = false
        tiresPackage = false
        ecuFuelPackage = false
        driveTrainPackage = false
        
    }
    
    
//    #Preview {
//        ContentView()
//    }
}

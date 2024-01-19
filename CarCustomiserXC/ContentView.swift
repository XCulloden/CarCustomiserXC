//
//  ContentView.swift
//  CarCustomiserXC
//
//  Created by xan culloden on 18/01/2024.
//

import SwiftUI

struct ContentView: View {
    let car = Car(make: "Mazda",model: "MX-5", topSpeed: 125, acceleration: 7.7, handling: 5)
    
    var body: some View {
        VStack {
        
            Text(car.displayStats())
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

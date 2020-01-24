//
//  ContentView.swift
//  Binding
//
//  Created by Nicola De FIlippo on 24/01/2020.
//  Copyright © 2020 Nicola De FIlippo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var random = 1
    
    var body: some View {
        VStack {
            CounterButton(random: $random, color: .blue)
            CounterButton(random: $random, color: .green)
            CounterButton(random: $random, color: .red)
        }
    }
}

struct CounterButton: View {
    
    @Binding var random: Int
    
    var color: Color
    
    var body: some View {
        Button(action: {
            self.random = Int.random(in: 0...100)
        }) {
            Circle()
                .frame(width: 200, height: 200)
                .foregroundColor(color)
                .overlay(
                    Text("\(random)")
                        .font(.system(size: 100, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



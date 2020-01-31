//
//  ContentView.swift
//  ButtonsExample
//
//  Created by Nicola De FIlippo on 31/01/2020.
//  Copyright © 2020 Nicola De FIlippo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
            Text(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/)
                .fontWeight(.bold)
                .font(.title)
                .padding()
                //.background(Color.red)
                .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(40)
                .foregroundColor(.white)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(Color.red, lineWidth: 5)
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

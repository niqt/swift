//
//  ContentView.swift
//  TextExample
//
//  Created by Nicola De FIlippo on 23/01/2020.
//  Copyright © 2020 Nicola De FIlippo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Your Text")
            .fontWeight(.bold)
            .font(.title)
            .foregroundColor(.yellow)
            .multilineTextAlignment(.center)
            .lineSpacing(10)
            .padding()
        .rotation3DEffect(.degrees(60), axis: (x: 1, y: 0, z: 0))
            .shadow(color: .gray, radius: 2, x: 0, y: 15)
            .background(Color.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

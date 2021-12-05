//
//  ContentView.swift
//  ButtonExample
//
//  Created by nicola on 28/03/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack() {

            Button(action: {
                
            }) {
                Text("Press")
                    .padding()
                    .foregroundColor(.white)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.black, Color.green]), startPoint: .trailing, endPoint: .leading
                    ))
                    .clipShape(Ellipse())
            }
            Text("Me")
                .foregroundColor(Color.green)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  stacks
//
//  Created by nicola on 12/04/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack() {
            Text("I'm level 0")
                .foregroundColor(Color.white)
                .padding(100)
                .background(Color.gray)
            Text("I'm level 1")
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .offset(x: 0, y: 100)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

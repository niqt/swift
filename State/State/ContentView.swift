//
//  ContentView.swift
//  State
//
//  Created by nicola on 26/04/21.
//

import SwiftUI

struct ContentView: View {
    @State var counter: Int = 0
    
    var body: some View {
        VStack() {
            Text(("Tapped \(counter) times"))
                .padding()
            PlusButton(counter: $counter)
            PlusButton(counter: $counter)
            PlusButton(counter: $counter)
        }
    }
}

struct PlusButton: View {
    @Binding var counter: Int
    var body: some View {
        HStack {
            Image(systemName: "plus.message")
            Button(action: {counter = counter + 1}, label: {
                Text("Tap")
            })
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(counter: 0)
    }
}

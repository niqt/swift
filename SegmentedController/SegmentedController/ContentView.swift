//
//  ContentView.swift
//  SegmentedController
//
//  Created by nicola on 31/12/20.
//

import SwiftUI

struct ContentView: View {
    @State private var selected = 0
    var colors = ["Red", "Green", "Blue"]
        var body: some View {
            SegmentedView(captions: colors, selected: $selected )
            Text("\(selected)")
        }
}

struct SegmentedView: View {
    var captions = Array<String>()
    @Binding var selected: Int
    
    var body: some View {
        VStack {
            Picker(selection: $selected, label: Text("What is your favorite color?")) {
                ForEach(0..<captions.count) { index in
                    Text(self.captions[index]).tag(index)
                }
            }.pickerStyle(SegmentedPickerStyle())

            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  SegmentController
//
//  Created by nicola de filippo on 02/01/24.
//

import SwiftUI

struct ContentView: View {
    @State private var daySelected = 0
    
    init() {
        // Color for the selected item
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.orange
        
        // The text color for the selected item
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        
        UISegmentedControl.appearance().setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.magenta], for: .normal)
    }
    
    var body: some View {
        VStack {
            Picker("Choose a day", selection: $daySelected) {
                Text("Mo").tag(0)
                Text("Tu").tag(1)
                Text("We").tag(2)
                Text("Th").tag(3)
                Text("Fr").tag(4)
                Text("Sa").tag(5)
                Text("Su").tag(6)
            }
            .pickerStyle(.segmented)
            .background(.yellow)
            DayView(day: daySelected)
            Spacer()
        }.padding()
    }
}

@ViewBuilder
func DayView(day: Int) -> some View {
    switch (day) {
    case 0:
        Text("Monday")
    case 1:
        Text("Tuesday")
    case 2:
        Text("Wednesday")
    case 3:
        Text("Thursday")
    case 4:
        Text("Friday")
    case 5:
        Text("Saturday")
    case 6:
        Text("Sunday")
    default:
        Text("")
    }
}

#Preview {
    ContentView()
}

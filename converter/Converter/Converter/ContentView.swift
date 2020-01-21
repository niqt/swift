//
//  ContentView.swift
//  TestLesson
//
//  Created by Nicola De Filippo on 21/01/2020.
//  Copyright © 2020 Nicola De FIlippo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var euro: String
    @State var dollari = ""
    var body: some View {
        VStack {
            Text("Insert euro to convert")
            .foregroundColor(Color.red)
            .fontWeight(.heavy)
            .padding()
            
            TextField("Euro", text: $euro)
                .padding()
            
            Button(action: {
                print(self.euro)
                var converted = 0.0
                if let value = Double(self.euro) {
                    converted = value / 1.1
                }
                self.dollari = String(format:"%f", converted)
                
            }) {
                
                Text("Convert")
            }
            .disabled(euro.count == 0)
            
            //Text("€ " + euro + " = $ " + dollari)
            Text("€ " + euro + " = $ " + convert(euro: euro))
            Spacer()
           
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(euro: "")
    }
}

func convert(euro: String) -> String {
    var converted = 0.0
    if let value = Double(euro) {
        converted = value / 1.1
    }
    let dollari = String(format:"%f", converted)
    return dollari
}

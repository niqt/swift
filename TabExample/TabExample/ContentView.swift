//
//  ContentView.swift
//  TabExample
//
//  Created by Nicola De FIlippo on 27/01/2020.
//  Copyright © 2020 Nicola De FIlippo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var places = [Place(name: "San Francisco", image: "sanfrancisco"),
       Place(name: "Stanford", image: "stanford"),
       Place(name: "Berkeley", image: "berkeley"),
       Place(name: "Giulianova", image: "giulianova"),
       Place(name: "Berlin", image: "berlin"),
       Place(name: "Benevento", image: "bn")]
    
    var body: some View {
            TabView {
                AllView(places: places)
                    .tabItem {
                        Image(systemName: "1.circle")
                        Text("Tutti")
                    }.tag(0)
                Text("Second View")
                    .tabItem {
                        Image(systemName: "2.circle")
                        Text("Preferiti")
                    }.tag(1)
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

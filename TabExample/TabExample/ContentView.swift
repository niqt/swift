//
//  ContentView.swift
//  TabExample
//
//  Created by Nicola De FIlippo on 27/01/2020.
//  Copyright © 2020 Nicola De FIlippo. All rights reserved.
//

/*
 

       ?  (__)  ?
      ?   (oo)   ?
   /-------\/
  / |     ||
 *  ||----||
    ^^    ^^
   Where Cow

 
 */

import SwiftUI

struct ContentView: View {
    var places = [Place(name: "San Francisco", image: "sanfrancisco"),
       Place(name: "Stanford", image: "stanford"),
       Place(name: "Berkeley", image: "berkeley"),
       Place(name: "Giulianova", image: "giulianova"),
       Place(name: "Berlin", image: "berlin"),
       Place(name: "Benevento", image: "bn")]
    
    @State var selectedView = 0
    @EnvironmentObject var settingStore: SettingStore
    var body: some View {
            TabView(selection: $selectedView) {
                AllView(places: places)
                    .tabItem {
                        Image(systemName: "1.circle")
                        Text("Places")
                    }.tag(0)
                OrderView()
                    .tabItem {
                        Image("red")
                        Text("Order")
                    }.tag(1)
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(SettingStore())    }
}


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
    @State var selectedView = 0
    @EnvironmentObject var settingStore: SettingStore
    var body: some View {
        TabView(selection: $selectedView) {
            AllView()
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


//
//  ContentView.swift
//  TabViewPost
//
//  Created by nicola on 10/05/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            VehiclesView() // View First Tab
                .tabItem {  Label("Vehicles", systemImage: "list.dash")}
            
            Text("Tab2") // View Second Tab
                .tabItem {  Label("Profile", systemImage: "person.circle")}
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

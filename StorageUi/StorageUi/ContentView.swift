//
//  ContentView.swift
//  StorageUi
//
//  Created by Nicola De FIlippo on 02/02/2020.
//  Copyright © 2020 Nicola De FIlippo. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @FetchRequest(
        entity: PlaceMO.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \PlaceMO.name, ascending: true),
            NSSortDescriptor(keyPath: \PlaceMO.desc, ascending: false)
        ],
        predicate: NSPredicate(format: "name == %@", "Pippo")
    ) var places: FetchedResults<PlaceMO>
    
    var body: some View {
        NavigationView {
            List(places, id: \.self) { place in
                    NavigationLink(destination: NewPlaceView()) {
                        Text(place.name ?? "Unknown")
                }
            }
            .navigationBarItems(trailing:
                NavigationLink(destination: NewPlaceView()) {
                    Image(systemName: "plus.app")
                }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

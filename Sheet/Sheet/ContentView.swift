//
//  ContentView.swift
//  Sheet
//
//  Created by Nicola De FIlippo on 30/01/2020.
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
    @State var showDetailView = false
    @State var selectedPlace: Place?
    
    var body: some View {
        NavigationView {
            List(places) {  place in
                BasicImageRow(place: place)
                .onTapGesture {
                    self.showDetailView = true
                    self.selectedPlace = place
                }
            }
            /*.sheet(isPresented: self.$showDetailView) {
                if self.selectedPlace != nil {
                    DetailView(place: self.selectedPlace!)
                }
            }*/
            .sheet(item: self.$selectedPlace) { place in
                DetailView(place: place)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BasicImageRow: View {
    var place: Place
    var body: some View {
        HStack {
            Image(place.image)
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(5)
            Text(place.name)
        }
    }
}

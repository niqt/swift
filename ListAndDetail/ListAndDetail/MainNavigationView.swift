//
//  NavigationView.swift
//  ListAndDetail
//
//  Created by Nicola De FIlippo on 24/01/2020.
//  Copyright © 2020 Nicola De FIlippo. All rights reserved.
//

import SwiftUI

struct MainNavigationView: View {
    var places = [Place(name: "San Francisco", image: "sanfrancisco", location: .init(latitude: 37.8199, longitude: -122.4783)),
                  Place(name: "Stanford", image: "stanford", location: .init(latitude: 37.4275, longitude: -122.1697)),
                  Place(name: "Berkeley", image: "berkeley", location: .init(latitude: 37.8715, longitude: -122.2730)),
                  Place(name: "Giulianova", image: "giulianova", location: .init(latitude: 42.7538, longitude: 13.9665)),
                  Place(name: "Berlin", image: "berlin", location: .init(latitude: 52.5200, longitude: 13.4050)),
                  Place(name: "Benevento", image: "bn", location: .init(latitude: 41.1298, longitude: 14.7826))]
    
    @State private var searchTerm : String = ""
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                SearchView(text: $searchTerm)
                List {
                    
                    /*ForEach(places) { place in
                     NavigationLink(destination: PlaceDetailView(place: place)) {
                     BasicImageRow(place: place)
                     }
                     
                     }*/
                    ForEach(self.places.filter {
                        self.searchTerm.isEmpty ? true : $0.name.localizedStandardContains(self.searchTerm)
                    }) { place in
                        NavigationLink(destination: PlaceDetailView(place: place, places: [place])) {
                            BasicImageRow(place: place)
                        }
                    }
                    
                }
                    //.navigationBarTitle("Places")
                    .navigationBarTitle("Places", displayMode: .inline)
                
                //.listStyle(GroupedListStyle())
            }
            .navigationBarItems(trailing:
                
                NavigationLink(destination: PlaceDetailView(place: Place(name: "", image: "", location: .init(latitude: -33.852222, longitude: 151.210556)))) {
                    Image(systemName: "plus.app")
                }
            )
        }
    }
}

struct NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        MainNavigationView()
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

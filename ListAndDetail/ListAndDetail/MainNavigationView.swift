//
//  NavigationView.swift
//  ListAndDetail
//
//  Created by Nicola De FIlippo on 24/01/2020.
//  Copyright © 2020 Nicola De FIlippo. All rights reserved.
//

import SwiftUI

struct MainNavigationView: View {
    var places = [Place(name: "San Francisco", image: "sanfrancisco"),
                  Place(name: "Stanford", image: "stanford"),
                  Place(name: "Berkeley", image: "berkeley"),
                  Place(name: "Giulianova", image: "giulianova"),
                  Place(name: "Berlin", image: "berlin"),
                  Place(name: "Benevento", image: "bn")]
    
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
                        NavigationLink(destination: PlaceDetailView(place: place)) {
                            BasicImageRow(place: place)
                        }
                    }
                    
                }
                    //.navigationBarTitle("Places")
                    .navigationBarTitle("Places", displayMode: .inline)
                
                //.listStyle(GroupedListStyle())
            }
            .navigationBarItems(trailing:
                
                NavigationLink(destination: PlaceDetailView(place: Place(name: "", image: ""))) {
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

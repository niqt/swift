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
    
    
    init() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.systemOrange, .font: UIFont(name: "ArialRoundedMTBold", size: 35)!]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.systemOrange, .font: UIFont(name: "ArialRoundedMTBold", size: 20)!]
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance
        
        navBarAppearance.setBackIndicatorImage(UIImage(systemName: "arrow.turn.up.left"),transitionMaskImage: UIImage(systemName: "arrow.turn.up.left"))
        
        UINavigationBar.appearance().tintColor = .black
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(places) { place in
                    NavigationLink(destination: PlaceDetailView(place: place)) {
                        BasicImageRow(place: place)
                    }
                }
                
            }
            //.navigationBarTitle("Places")
            .navigationBarTitle("Places", displayMode: .inline)
            .listStyle(GroupedListStyle())
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

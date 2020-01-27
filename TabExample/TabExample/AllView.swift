//
//  AllView.swift
//  TabExample
//
//  Created by Nicola De FIlippo on 27/01/2020.
//  Copyright © 2020 Nicola De FIlippo. All rights reserved.
//

import SwiftUI

struct AllView: View {
    var places = Array<Place>()
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

struct AllView_Previews: PreviewProvider {
    static var previews: some View {
        AllView()
    }
}

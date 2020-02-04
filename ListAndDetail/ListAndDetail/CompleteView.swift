//
//  CompleteView.swift
//  ListAndDetail
//
//  Created by Nicola De FIlippo on 23/01/2020.
//  Copyright © 2020 Nicola De FIlippo. All rights reserved.
//

import SwiftUI

struct CompleteView: View {
    var places = [Place(name: "San Francisco", image: "sanfrancisco",location: .init(latitude: -33.852222, longitude: 151.210556)),
    Place(name: "Stanford", image: "stanford",location: .init(latitude: -33.852222, longitude: 151.210556)),
    Place(name: "Berkeley", image: "berkeley",location: .init(latitude: -33.852222, longitude: 151.210556)),
    Place(name: "Giulianova", image: "giulianova",location: .init(latitude: -33.852222, longitude: 151.210556)),
    Place(name: "Berlin", image: "berlin",location: .init(latitude: -33.852222, longitude: 151.210556)),
    Place(name: "Benevento", image: "bn",location: .init(latitude: -33.852222, longitude: 151.210556))]
    
    var body: some View {
        // List(places, id: \.name) { place in
        // List(places, id: \.id) { place in
        List(places) {  place in
            FullImageRow(place: place)
        }
        
        /*
         List(places.indices) { index in
            if (0...1).contains(index) {
                FullImageRow(place: self.places[index])
            } else {
                BasicImageRow(place: self.places[index])
            }
         }
         */
    }
}


struct FullImageRow: View {
    var place: Place
    var body: some View {
        ZStack {
            Image(place.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .cornerRadius(10)
                .overlay(
                    Rectangle()
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .opacity(0.2)
            )
            Text(place.name)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .foregroundColor(.white)
        }
    }
}

struct CompleteView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteView()
    }
}

struct BasicImageView: View {
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

//
//  PlaceDetailView.swift
//  ListAndDetail
//
//  Created by Nicola De FIlippo on 24/01/2020.
//  Copyright © 2020 Nicola De FIlippo. All rights reserved.
//

import SwiftUI

struct PlaceDetailView: View {
    @State var place: Place?
    @State var places = Array<Place>()
    @State var selectedLandmark: Place? = nil
    var body: some View {
        VStack {
            Image(place!.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipped()
            Text(place!.name)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
            MapView(landmarks: $places, selectedLandmark:$place)
            Spacer()
        }
    }
}

struct PlaceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceDetailView(place: Place(name: "sanfrancisco", image: "sanfrancisco", location: .init(latitude: -33.852222, longitude: 151.210556)))
    }
}

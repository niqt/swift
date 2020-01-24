//
//  PlaceDetailView.swift
//  ListAndDetail
//
//  Created by Nicola De FIlippo on 24/01/2020.
//  Copyright © 2020 Nicola De FIlippo. All rights reserved.
//

import SwiftUI

struct PlaceDetailView: View {
    var place: Place
    var body: some View {
        VStack {
            Image(place.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipped()
            Text(place.name)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
            Spacer()
        }
    }
}

struct PlaceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceDetailView(place: Place(name: "sanfrancisco", image: "sanfrancisco"))
    }
}

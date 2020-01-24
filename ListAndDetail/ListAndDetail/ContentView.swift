//
//  ContentView.swift
//  ListAndDetail
//
//  Created by Nicola De FIlippo on 23/01/2020.
//  Copyright © 2020 Nicola De FIlippo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var places = ["San Francisco", "Stanford", "Giulianova", "Berkeley"]
    var images = ["sanfrancisco", "stanford", "giulianova", "berkeley"]
    var body: some View {
        List(places.indices, id: \.self) { index in
            HStack {
                Image(self.images[index])
                    .resizable()
                    .frame(width: 40, height: 40)
                    .cornerRadius(5)
                Text(self.places[index])
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

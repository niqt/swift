//
//  ContentView.swift
//  GroupExample
//
//  Created by Nicola De FIlippo on 30/01/2020.
//  Copyright © 2020 Nicola De FIlippo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image("bn")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Group {
                    Text("Benevento")
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.black)
                        .lineLimit(3)
                    Text("Maleventum".uppercased())
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.bottom, 0)
                .padding(.horizontal)
                
                Text("Benevento is a city and comune of Campania, Italy, capital of the province of Benevento, 50 kilometres northeast of Naples. It is situated on a hill 130 metres above sea level at the confluence of the Calore Irpino and the Sabato. It is also the seat of a Roman Catholic archbishop")
                    .font(.body)
                    .padding()
                    .lineLimit(1000)
                    .multilineTextAlignment(.leading)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

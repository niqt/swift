//
//  ContentView.swift
//  24gen2020
//
//  Created by Nicola De FIlippo on 24/01/2020.
//  Copyright © 2020 Nicola De FIlippo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.horizontal) {
            //VStack {
                HStack{
                Card(image: "sanfrancisco", text: "San Francisco bay")
                Card(image: "stanford", text: "Church")
                Card(image: "berkeley", text: "Library")
                }
                Spacer()
            //}
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Card: View {
    var image: String
    var text: String
    var body: some View {
        Image(image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 300)
            .opacity(0.5)
            .overlay(
                Text(text)
                    .fontWeight(.heavy)
                    .font(.system(.headline, design: .rounded))
                    .foregroundColor(.yellow)
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(20)
                    .opacity(0.8)
                    .padding(),
                alignment: .top
                
        )
    }
}

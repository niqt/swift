//
//  ContentView.swift
//  Card
//
//  Created by Nicola De FIlippo on 23/01/2020.
//  Copyright © 2020 Nicola De FIlippo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.horizontal) {
            VStack {
                HStack {
                    card(imageName: "sanfrancisco", text: "Bay")
                    card(imageName: "giulianova", text: "Sea")
                    card(imageName: "berkeley", text: "Library")
                    card(imageName: "stanford", text: "Church")
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct card: View {
    var imageName: String
    var text: String
    var body: some View {
        Image(imageName)
            .resizable()
            //.edgesIgnoringSafeArea(.all)
            .aspectRatio(contentMode: .fit)
            //.aspectRatio(contentMode: .fill)
            .frame(width: 300)
            //.clipShape(Circle())
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

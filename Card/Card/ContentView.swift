//
//  ContentView.swift
//  Card
//
//  Created by Nicola De FIlippo on 23/01/2020.
//  Copyright © 2020 Nicola De FIlippo. All rights reserved.
//

import SwiftUI
import Foundation

struct Place: Identifiable {
    var id = UUID()
    var name: String
    var imagename: String
}


struct ContentView: View {
    var places = [Place(name: "Bay", imagename: "sanfrancisco"), Place(name: "Giulianova", imagename: "giulianova")]
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView() {
                    HStack {
                        ForEach(self.places) { place in
                            NavigationLink(destination: DetailView()) {
                                CardView(imageName: place.imagename, text: place.name)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    //Spacer()
                }
                ScrollView() {
                    VStack {
                        ForEach(self.places) { place in
                            NavigationLink(destination: DetailView()) {
                                CardView(imageName: place.imagename, text: place.name)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    //Spacer()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DetailView: View {
    var body: some View {
        Text("Ciao")
    }
}


struct CardView: View {
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

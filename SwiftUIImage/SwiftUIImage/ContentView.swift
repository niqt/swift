//
//  ContentView.swift
//  SwiftUIImage
//
//  Created by nicola on 19/04/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("sanfrancisco")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 300)
            .opacity(0.5)
            .overlay(
                Text("San Francisco bay ")
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
            Spacer()
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/*
 .rotationEffect(.init(degrees: 30))
 
 .cornerRadius(40)
 .padding()
 */

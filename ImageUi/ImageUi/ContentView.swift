//
//  ContentView.swift
//  ImageUi
//
//  Created by Nicola De FIlippo on 21/01/2020.
//  Copyright © 2020 Nicola De Filippo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("sanfrancisco")
            .resizable()
            //.edgesIgnoringSafeArea(.all)
            .aspectRatio(contentMode: .fit)
            //.aspectRatio(contentMode: .fill)
            .frame(width: 300)
            //.clipShape(Circle())
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

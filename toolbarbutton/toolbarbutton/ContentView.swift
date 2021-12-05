//
//  ContentView.swift
//  toolbarbutton
//
//  Created by nicola on 17/05/21.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        let navBarAppearance = UINavigationBarAppearance()
            
        navBarAppearance.backgroundColor = UIColor.purple
        
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.systemRed,  .font: UIFont(name: "ArialRoundedMTBold", size:35)!]
    
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.systemRed, .font: UIFont(name: "ArialRoundedMTBold", size: 20)!]
               
        
        
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance
        
        navBarAppearance.setBackIndicatorImage(UIImage(systemName: "arrow.turn.up.left"), transitionMaskImage: UIImage(systemName: "arrow.turn.up.left"))
                
        UINavigationBar.appearance().tintColor = UIColor.white
        UITabBar.appearance().barTintColor = .purple
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello, world!")
                    .padding()
            }
            .navigationBarTitle("Title", displayMode: .inline)
            .toolbar(content: {
                NavigationLink(destination: EmptyView()) {
                    Image(systemName: "paperplane")
                    .font(.title)
                    .foregroundColor(.primary)
                }
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/*
 NavigationView {
     VStack {
         Text("Hello, world!")
             .padding()
     }
     .navigationBarTitle("Title", displayMode: .inline)
     .toolbar(content: {
         NavigationLink(destination: EmptyView()) {
             Image(systemName: "square.grid.2x2")
             .font(.title)
             .foregroundColor(.primary)
         }
     })
 }
 */

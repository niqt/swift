//
//  AllView.swift
//  TabExample
//
//  Created by Nicola De FIlippo on 27/01/2020.
//  Copyright © 2020 Nicola De FIlippo. All rights reserved.
//

import SwiftUI

struct AllView: View {
    @State var sorted = Array<Place>()
    @State var places = [Place(name: "San Francisco", image:"sanfrancisco"),
    Place(name: "Stanford", image: "stanford"),
    Place(name: "Berkeley", image: "berkeley"),
    Place(name: "Giulianova", image: "giulianova"),
    Place(name: "Berlin", image: "berlin"),
    Place(name: "Benevento", image: "bn")]
    
    @EnvironmentObject var settingStore: SettingStore
    var body: some View {
         NavigationView {
            List {
                ForEach(self.places) { place in
                    NavigationLink(destination: PlaceDetailView(place: place)) {
                        BasicImageRow(place: place)
                    }
                
                }
                .onDelete { (indexSet) in
                    //let toDelete = self.sorted[indexSet]
                    
                    self.places.remove(atOffsets: indexSet)
                    //print(toDelete)
                }
            }
            .navigationBarTitle("Places", displayMode: .inline)
            .listStyle(GroupedListStyle())
         }
         .onAppear{
            self.places = self.places.sorted(by:self.settingStore.displayOrder.predicate())
        }
    }
}

struct BasicImageRow: View {
    var place: Place
    var body: some View {
        HStack {
            Image(place.image)
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(5)
            Text(place.name)
        }
    }
}

struct AllView_Previews: PreviewProvider {
    static var previews: some View {
        AllView().environmentObject(SettingStore())
        
    }
}

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
    var places = Array<Place>()
    @EnvironmentObject var settingStore: SettingStore
    var body: some View {
         NavigationView {
            List {
                ForEach(self.sorted) { place in
                    NavigationLink(destination: PlaceDetailView(place: place)) {
                        BasicImageRow(place: place)
                    }
                
                }
            }
            .navigationBarTitle("Places", displayMode: .inline)
            .listStyle(GroupedListStyle())
         }
         .onAppear{
            self.sorted = self.places.sorted(by:self.settingStore.displayOrder.predicate())
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

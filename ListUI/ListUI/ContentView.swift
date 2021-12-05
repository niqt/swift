//
//  ContentView.swift
//  ListUI
//
//  Created by nicola on 03/05/21.
//

import SwiftUI

struct Vehicle: Identifiable {
    var id = UUID()
    var name: String
    var image: String
}

struct ContentView: View {
    @State var vehicles = [Vehicle(name: "car", image: "car"),
                    Vehicle(name: "bus", image: "bus"),
                    Vehicle(name: "tram", image: "tram"),
                    Vehicle(name: "bicycle", image: "bicycle")]
    
    var body: some View {
        List {
            ForEach(vehicles) { vehicle in
                RowView(vehicle: vehicle)
            }
            .onDelete { (indexSet) in
                self.vehicles.remove(atOffsets: indexSet)
            }
        }
    }
}

struct RowView: View {
    var vehicle: Vehicle
    var body: some View {
        HStack {
            Image(systemName: vehicle.image)
                .resizable()
                .frame(width: 60, height: 60)
            Text(vehicle.name)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


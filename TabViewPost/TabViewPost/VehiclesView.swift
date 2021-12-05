//
//  VehiclesView.swift
//  TabViewPost
//
//  Created by nicola on 10/05/21.
//

import SwiftUI

struct Vehicle: Identifiable {
    var id = UUID()
    var name: String
    var image: String
}

struct VehiclesView: View {
    @State var vehicles = [Vehicle(name: "car", image: "car"),
                    Vehicle(name: "bus", image: "bus"),
                    Vehicle(name: "tram", image: "tram"),
                    Vehicle(name: "bicycle", image: "bicycle")]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vehicles) { vehicle in
                    NavigationLink(destination: VehicleView(vehicle: vehicle)) {
                        RowView(vehicle: vehicle)
                    }
                }
                .onDelete { (indexSet) in
                    self.vehicles.remove(atOffsets: indexSet)
                }
            }.navigationBarTitle("Transports", displayMode: .inline)
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

struct VehiclesView_Previews: PreviewProvider {
    static var previews: some View {
        VehiclesView()
    }
}

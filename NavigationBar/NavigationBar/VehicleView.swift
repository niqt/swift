//
//  VehicleView.swift
//  NavigationBar
//
//  Created by nicola on 10/05/21.
//

import SwiftUI

struct VehicleView: View {
    var vehicle: Vehicle
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: vehicle.image)
                .resizable()
                .frame(width: 300, height: 300)
            Text("Selected the \(vehicle.name.uppercased())")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Spacer()
        }
    }
}
struct VehicleView_Previews: PreviewProvider {
    static var previews: some View {
        VehicleView(vehicle: Vehicle(name: "car", image: "car"))
    }
}

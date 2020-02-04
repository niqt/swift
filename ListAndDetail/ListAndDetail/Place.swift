//
//  Place.swift
//  ListAndDetail
//
//  Created by Nicola De FIlippo on 24/01/2020.
//  Copyright © 2020 Nicola De FIlippo. All rights reserved.
//

import Foundation
import CoreLocation

struct Place: Identifiable, Equatable {
    static func ==(lhs: Place, rhs: Place) -> Bool {
        lhs.id == rhs.id
    }
    let id = UUID()
    let name: String
    let image: String
    let location: CLLocationCoordinate2D
}

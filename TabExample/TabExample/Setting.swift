//
//  Setting.swift
//  TabExample
//
//  Created by Nicola De FIlippo on 27/01/2020.
//  Copyright © 2020 Nicola De FIlippo. All rights reserved.
//

import Foundation
import Combine

enum OrderType: Int, CaseIterable {
    case asc = 0
    case desc = 1
        
    init(type: Int) {
        switch type {
        case 0: self = .asc
        case 1: self = .desc
        default: self = .asc
        }
    }
  
    var text: String {
        switch self {
        case .asc: return "Ascending"
        case .desc: return "Descending"
        }
    }
    
    func predicate() -> ((Place, Place) -> Bool) {
        switch self {
        case .asc: return { $0.name < $1.name }
        case .desc: return { $0.name > $1.name}
        }
    }
}

final class SettingStore: ObservableObject {
    @Published var defaults: UserDefaults
    
    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
        
        defaults.register(defaults: [
            "displayOrder" : 0
        ])
    }

    var displayOrder: OrderType {
        get {
            OrderType(type: defaults.integer(forKey: "displayOrder"))
        }
     
        set {
            defaults.set(newValue.rawValue, forKey: "displayOrder")
        }
    }
}

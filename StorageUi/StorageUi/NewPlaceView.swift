//
//  NewPlaceView.swift
//  StorageUi
//
//  Created by Nicola De FIlippo on 02/02/2020.
//  Copyright © 2020 Nicola De FIlippo. All rights reserved.
//

import SwiftUI

struct NewPlaceView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @State var name = ""
    @State var desc = ""
    var body: some View {
        VStack {
            TextField("Name", text: $name)
            TextField("Description", text: $desc)
            
            Button(action: {
                let place = PlaceMO(context: self.managedObjectContext)
                place.name = self.name
                place.desc = self.desc
                do {
                    try self.managedObjectContext.save()
                } catch {
                    print("SAVING ERROR")
                }
            }) {
                Text("Save")
            }
        }
    }
}

struct NewPlaceView_Previews: PreviewProvider {
    static var previews: some View {
        NewPlaceView()
    }
}

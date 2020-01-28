//
//  OrderView.swift
//  TabExample
//
//  Created by Nicola De FIlippo on 28/01/2020.
//  Copyright © 2020 Nicola De FIlippo. All rights reserved.
//

import SwiftUI

struct OrderView: View {
    @State var order: Bool = false
    @EnvironmentObject var settingStore: SettingStore
    @State var msgOrder: String! = "Ascending Order"
    var body: some View {
        VStack {
            Toggle("Order", isOn: $order)
                

            if order {
                Text("Descending Order")
            } else {
                Text("Ascending Order")
            }
            Button(action: {
                if self.order {
                    self.settingStore.displayOrder = .desc
                } else {
                    self.settingStore.displayOrder = .asc
                }
            }
            ) {
                Text(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/)
            }
        }.onDisappear {
            if self.order {
                self.settingStore.displayOrder = .desc
            } else {
                self.settingStore.displayOrder = .asc
            }
            print("QUI \(self.settingStore.displayOrder)")
        }.onAppear{
            if self.settingStore.displayOrder == .desc {
                self.order = true
            } else {
                self.order = false
            }
        }
        
        
    }
}



struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}

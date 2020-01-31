//
//  DetailView.swift
//  Sheet
//
//  Created by Nicola De FIlippo on 30/01/2020.
//  Copyright © 2020 Nicola De FIlippo. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    var place = Place(name: "", image: "")
    //@State var showAlert = false
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ScrollView {
            VStack {
                Image(place.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text(place.name)
                Spacer()
            }
//            .alert(isPresented: $showAlert) {
//                Alert(title: Text("Reminder"), message: Text("Sicuro di voler chiudere?"), primaryButton: .default(Text("Si"), action: { self.presentationMode.wrappedValue.dismiss() }), secondaryButton: .cancel(Text("No")))
//            }
            .overlay(
                HStack {
                    Spacer()
                    VStack {
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                            //self.showAlert = true
                        }, label: {
                            Image(systemName: "chevron.down.circle.fill")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                        })
                            .padding(.trailing, 20)
                            .padding(.top, 40)
                        Spacer()
                    }
                }
            )
            .edgesIgnoringSafeArea(.top)
        }
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}

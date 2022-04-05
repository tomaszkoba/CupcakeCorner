//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Tomasz Koba on 05/04/2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var order = Order()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.type) {
                        ForEach(Order.types.indices) {
                            Text(Order.types[$0])
                        }
                        
                        Stepper("Number of cakes: \(order.quantity)", value: $order.quantity, in: 3...20)
                    }
                }
                Section {
                    Toggle("Any special requests?", isOn: $order.specialRequestEnabled.animation())
                    
                    if order.specialRequestEnabled {
                        Toggle("Add extravfrosting", isOn: $order.extraFrosting)
                        
                        Toggle("Add extravsprinkles", isOn: $order.addSprinkles)
                    }
                }
                Section {
                    NavigationLink {
                        AddressView(order: order)
                    } label: {
                        Text("Delivery details")
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

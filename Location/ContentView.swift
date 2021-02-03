//
//  ContentView.swift
//  Location
//
//  Created by Etienne Vautherin on 02/02/2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var model: Model
    
    var body: some View {
        NavigationView {
            List(model.locations) { location in
                NavigationLink(destination: LocationDetail(location: location)) {
                    Text(location.id)
                }
            }
            .navigationTitle("Locations")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(model: Model())
    }
}

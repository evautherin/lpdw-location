//
//  ContentView.swift
//  Location
//
//  Created by Etienne Vautherin on 02/02/2021.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
    let model: Model

    var body: some View {
        TabView {
            LocationsView(model: model)
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Locations")
                }

            OtherView(model: model)
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("Other")
                }
        }
    }
}


struct LocationsView: View {
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


struct OtherView: View {
    @ObservedObject var model: Model
    
    var origin: CLLocationCoordinate2D? {
        model.locations.first?.coordinate
    }
    
    var body: some View {
        origin.map { origin in
            MapView(coordinate: origin, locations: model.locations)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(model: Model())
    }
}

//
//  ContentView.swift
//  Location
//
//  Created by Etienne Vautherin on 02/02/2021.
//

import SwiftUI


struct ContentView: View {
    let model: Model

    var body: some View {
        TabView {
            LocationsList(model: model)
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Locations List")
                }

            LocationsMap(model: model)
                .tabItem {
                    Image(systemName: "map")
                    Text("Locations Map")
                }

            Notifications()
                .tabItem {
                    Image(systemName: "bell.badge")
                    Text("Notifications")
                }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(model: Model())
    }
}

//
//  LocationsList.swift
//  Location
//
//  Created by Etienne Vautherin on 04/02/2021.
//

import SwiftUI

struct LocationsList: View {
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




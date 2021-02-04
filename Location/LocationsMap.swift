//
//  LocationsMap.swift
//  Location
//
//  Created by Etienne Vautherin on 04/02/2021.
//

import SwiftUI
import CoreLocation


struct LocationsMap: View {
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


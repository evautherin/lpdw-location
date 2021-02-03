//
//  LocationDetail.swift
//  Location
//
//  Created by Etienne Vautherin on 03/02/2021.
//

import SwiftUI

struct LocationDetail: View {
    var location: Location

    var body: some View {
        MapView(coordinate: location.coordinate)
    }
}


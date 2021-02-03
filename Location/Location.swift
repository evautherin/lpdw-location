//
//  Location.swift
//  Location
//
//  Created by Etienne Vautherin on 03/02/2021.
//

import Foundation
import CoreLocation

struct Location: Identifiable {
    var id: String {
        "\(coordinates.latitude)-\(coordinates.longitude)"
    }
    
    let coordinates: CLLocationCoordinate2D
}

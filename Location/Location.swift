//
//  Location.swift
//  Location
//
//  Created by Etienne Vautherin on 03/02/2021.
//

import Foundation
import CoreLocation

struct Location: Identifiable {
    let coordinate: CLLocationCoordinate2D

    var id: String { "\(coordinate.latitude) | \(coordinate.longitude)" }
    
    
    init(location: CLLocation) {
        self.coordinate = location.coordinate
    }
}


extension CLLocation {
    var location: Location { Location(location: self) }
}

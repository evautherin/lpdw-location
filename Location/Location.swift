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
        "\(coordinate.latitude)|\(coordinate.longitude)"
    }
    
    let coordinate: CLLocationCoordinate2D
    
    
    init(location: CLLocation) {
        self.coordinate = location.coordinate
    }
}

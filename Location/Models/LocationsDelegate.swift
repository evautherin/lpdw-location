//
//  Delegate.swift
//  Location
//
//  Created by Etienne Vautherin on 02/02/2021.
//

import UIKit
import CoreLocation
import Combine

// 37.334361 -122.041452


class LocationsDelegate: NSObject {
    let locationSubject = PassthroughSubject<CLLocation, Never>()
}


extension LocationsDelegate: CLLocationManagerDelegate {
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        let status = manager.authorizationStatus
        
//        print("locationManagerDidChangeAuthorization: \(status.description)")
        
        if status == .authorizedWhenInUse {
            manager.desiredAccuracy = kCLLocationAccuracyBest
            manager.distanceFilter = 150.0
            manager.showsBackgroundLocationIndicator = true
            manager.allowsBackgroundLocationUpdates = true
            manager.startUpdatingLocation()
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("didUpdateLocations: \(locations.description)")
        
        if let location = locations.last {
            locationSubject.send(location)
        }
    }
}


extension CLAuthorizationStatus {
    var description: String {
        switch self {
        case .notDetermined: return "notDetermined"
        case .restricted: return "restricted"
        case .denied: return "denied"
        case .authorizedAlways: return "authorizedAlways"
        case .authorizedWhenInUse: return "authorizedWhenInUse"
        @unknown default: return "unknown"
        }
    }
}

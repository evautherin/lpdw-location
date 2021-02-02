//
//  Delegate.swift
//  Location
//
//  Created by Etienne Vautherin on 02/02/2021.
//

import UIKit
import CoreLocation


class Delegate: NSObject {

}


extension Delegate: CLLocationManagerDelegate {
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        let status = manager.authorizationStatus
        
        print("locationManagerDidChangeAuthorization: \(status.description)")
        
        if status == .authorizedWhenInUse {
            manager.desiredAccuracy = kCLLocationAccuracyBest
            manager.distanceFilter = 150.0
            manager.startUpdatingLocation()
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("didUpdateLocations: \(locations.description)")
    }
}


extension CLAuthorizationStatus {
    var description: String {
        switch self {
        
        case .notDetermined:
            return "notDetermined"
            
        case .restricted:
            return "restricted"
            
        case .denied:
            return "denied"

        case .authorizedAlways:
            return "authorizedAlways"

        case .authorizedWhenInUse:
            return "authorizedWhenInUse"

        @unknown default:
            return "unknown"

        }
    }
}

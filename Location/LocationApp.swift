//
//  LocationApp.swift
//  Location
//
//  Created by Etienne Vautherin on 02/02/2021.
//

import SwiftUI
import CoreLocation

@main
struct LocationApp: App {
    let manager = CLLocationManager()
    let delegate = Delegate()
    
    init() {
        print("LocationApp")
        manager.delegate = delegate
        manager.requestWhenInUseAuthorization()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

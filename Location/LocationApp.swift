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
    let model = Model()
    
    var body: some Scene {
        WindowGroup {
            ContentView(model: model)
        }
    }
}

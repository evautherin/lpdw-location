//
//  Model.swift
//  Location
//
//  Created by Etienne Vautherin on 03/02/2021.
//

import Foundation
import SwiftUI
import CoreLocation
import Combine


class Model: ObservableObject {
    @Published var locations = [Location]()
    
    let manager = CLLocationManager()
    let delegate = Delegate()
    var subscription: AnyCancellable?
    
    init() {
//        delegate.locationSubject
//            .map({ location in
//                Location(location: location)
//            })
        
        subscription = delegate.locationSubject
            .map(Location.init)
            .sink(receiveValue: { (location) in
                self.locations.append(location)
            })

        manager.delegate = delegate
        manager.requestWhenInUseAuthorization()
    }
    
}

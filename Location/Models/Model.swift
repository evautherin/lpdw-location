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
    let locationsDelegate = LocationsDelegate()
    let notificationsDelegate = NotificationsDelegate()
    var subscription: AnyCancellable?
    var subscription2: AnyCancellable?

    
    init() {
//        delegate.locationSubject
//            .map({ location in
//                Location(location: location)
//            })
        
//        delegate.locationSubject
//            .map(Location.init)

//        subscription = locationsDelegate.locationSubject
//            .map(\.location)
//            .sink(receiveValue: { (location) in
//                self.locations.append(location)
//            })

        subscription2 = locationsDelegate.locationSubject
            .prefix(5)
            .collect()
            .sink(receiveValue: { _ in
                NotificationsDelegate.notify(
                    title: "Le compteur à bougé !",
                    body: "5 fois"
                )
            })

        manager.delegate = locationsDelegate
        manager.requestWhenInUseAuthorization()
    }
    
}

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
            .map(\.location)
            .prefix(5)
            .collect()
            .sink(receiveValue: { _ in
                let content = UNMutableNotificationContent()
                content.title = "Nouvelles positions"
                content.body = "On a bouger 5 fois"
    //            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10.0, repeats: false)
                
                // Create the request
                let uuidString = UUID().uuidString
                let request = UNNotificationRequest(identifier: uuidString,
                                                    content: content, trigger: .none)

                // Schedule the request with the system.
                let notificationCenter = UNUserNotificationCenter.current()
                notificationCenter.add(request) { (error) in
                   if error != nil {
                      // Handle any errors.
                   }
                }
            })

        manager.delegate = locationsDelegate
        manager.requestWhenInUseAuthorization()
    }
    
}

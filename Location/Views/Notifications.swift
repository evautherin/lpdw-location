//
//  Notifications.swift
//  Location
//
//  Created by Etienne Vautherin on 04/02/2021.
//

import Foundation
import SwiftUI
import UserNotifications
import CoreLocation


struct Notifications: View {

    var body: some View {
        Button("Notification Cupertino Bridge") {
            let content = UNMutableNotificationContent()
            content.title = "On arrive"
            content.body = "Sous le pont"
            let region = CLCircularRegion(
                center: CLLocationCoordinate2D(
                    latitude: 37.334361,
                    longitude: -122.041452
                ),
                radius: 150.0,
                identifier: "Cupertino Bridge")
            region.notifyOnExit = false
            region.notifyOnEntry = true
            
            let trigger = UNLocationNotificationTrigger(region: region, repeats: true)
            
            // Create the request
            let uuidString = UUID().uuidString
            let request = UNNotificationRequest(identifier: uuidString,
                                                content: content, trigger: trigger)

            // Schedule the request with the system.
            let notificationCenter = UNUserNotificationCenter.current()
            notificationCenter.add(request) { (error) in
               if let error = error {
                  // Handle any errors.
                print(error.localizedDescription)
               } else {
                print("Location Notification OK")
               }
            }
        }
    }
}

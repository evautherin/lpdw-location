//
//  Notifications.swift
//  Location
//
//  Created by Etienne Vautherin on 04/02/2021.
//

import Foundation
import SwiftUI
import UserNotifications


struct Notifications: View {

    var body: some View {
        Button("Notification") {
            let content = UNMutableNotificationContent()
            content.title = "Notification Title"
            content.body = "Notification body"
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10.0, repeats: false)
            
            // Create the request
            let uuidString = UUID().uuidString
            let request = UNNotificationRequest(identifier: uuidString,
                                                content: content, trigger: trigger)

            // Schedule the request with the system.
            let notificationCenter = UNUserNotificationCenter.current()
            notificationCenter.add(request) { (error) in
               if error != nil {
                  // Handle any errors.
               }
            }
        }
    }
}

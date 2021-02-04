//
//  NotificationsDelegate.swift
//  Location
//
//  Created by Etienne Vautherin on 04/02/2021.
//

import UIKit
import UserNotifications


class NotificationsDelegate: NSObject {
    
    override init() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            
            if (error != nil) {
                print("Notification Request Authorization Error: \(error!.localizedDescription)")
            }

            if let existingError = error {
                // Handle the error here.
                print("Notification Request Authorization Error: \(existingError.localizedDescription)")
            }
            
            if let error = error {
                // Handle the error here.
                print("Notification Request Authorization Error: \(error.localizedDescription)")
            }
            
            // Enable or disable features based on the authorization.
            print(granted ? "Notifications granted" : "No notifications")
        }
    }

}

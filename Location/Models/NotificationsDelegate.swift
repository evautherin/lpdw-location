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
        super.init()
        
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            
            // Code du siècle dernier
            if (error != nil) {
                print("Notification Request Authorization Error: \(error!.localizedDescription)")
                /*
                error! signifie :
                Je sais que error contient une valeur, donc je la prends.
                 
                Si, par malheur, error n'avait de valeur,
                j'assume le risque d'un plantage de l'app.
                */
            }

            // Code avec nom distinct pour "error avec valeur" et "error optional"
            if let existingError = error {
                // Handle the error here.
                print("Notification Request Authorization Error: \(existingError.localizedDescription)")
            }
            
            // Code habituel avec nom identique pour "error avec valeur" et "error optional"
            if let error = error {
                // Handle the error here.
                print("Notification Request Authorization Error: \(error.localizedDescription)")
            }
            
            // Enable or disable features based on the authorization.
            print(granted ? "Notifications granted" : "No notifications")
        }
    }
    
    
    static func notify(title: String, body: String) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
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
    }

}


extension NotificationsDelegate: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        completionHandler([.badge, .banner, .list, .sound])
    }
    
}

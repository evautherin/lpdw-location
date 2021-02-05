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
            NotificationsDelegate.notify(
                title: "A m'a cliqué dessus !",
                body: "Ca fait pas mal"
            )
        }
    }
}

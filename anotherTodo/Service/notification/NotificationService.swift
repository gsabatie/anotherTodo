//
// Created by guillaume sabatié on 09/07/2018.
// Copyright (c) 2018 guillaume sabatié. All rights reserved.
//

import UIKit
import UserNotifications

class NotificationService: NSObject {

    struct ActionIdentifier {
        static let delete = "DeleteAction"
    }

    struct CategoryIdentifier {
        static let task = "TaskCategory"
    }

    let center = UNUserNotificationCenter.current()
    let options: UNAuthorizationOptions = [.alert, .sound, .badge];

    override init() {
        super.init()
        center.requestAuthorization(options: options) {
            (granted, error) in
            if !granted {
                print("Something went wrong")
            }
        }
        let deleteAction = UNNotificationAction(identifier: ActionIdentifier.delete,
                                                title: "Delete", options: [.destructive])
        let category = UNNotificationCategory(identifier: CategoryIdentifier.task,
                                              actions: [deleteAction],
                                              intentIdentifiers: [], options: [])
        center.setNotificationCategories([category])

    }
}

extension NotificationService: NotificationServiceInput {
    func create(with body: String, title: String, categoryIdentifier: String, fireDate: Date, id: String) {
        center.getNotificationSettings { (settings) in
            guard settings.authorizationStatus == .authorized else {
                print("no notifiction")
                return
            }
            if categoryIdentifier == CategoryIdentifier.task {
                let content = UNMutableNotificationContent()
                content.title = title
                content.body = body
                content.categoryIdentifier = CategoryIdentifier.task
                content.sound = UNNotificationSound.default()

                let fireDateComponent = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second, ],
                                                                        from: fireDate)
                let trigger = UNCalendarNotificationTrigger(dateMatching: fireDateComponent,
                                                            repeats: false)
                let request = UNNotificationRequest(identifier: id,
                                                    content: content, trigger: trigger)
                self.center.add(request, withCompletionHandler: { (error) in
                    if let error = error {
                        print(error)
                    }
                })
            }
        }

    }
}

extension NotificationService: UNUserNotificationCenterDelegate {

    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound])
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {

        switch response.actionIdentifier {
        case "Delete":
            print("Delete")
        default:
            print("Unknown action")
        }
        completionHandler()
    }
}
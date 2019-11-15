//
//  Notification.swift
//  authTest
//
//  Created by WSR on 15/11/2019.
//  Copyright © 2019 WSR. All rights reserved.
//

import UIKit
import UserNotifications
class Notification: NSObject, UNUserNotificationCenterDelegate {
   let notificationCentre = UNUserNotificationCenter.current()
    func requestAuth() {
        notificationCentre.requestAuthorization(options: [.alert, .sound, .badge]) { (status, error) in
            print(status)
            guard status else {return}
            self.notificationSetting()
        }
    }
    
    func notificationSetting() {
        notificationCentre.getNotificationSettings { (settings) in
            print(settings)
        }
    }
    
    func notification() {
    let  contnent = UNMutableNotificationContent()
        contnent.title = "Привет!"
        contnent.body = "Часто тут бываешь?"
        contnent.sound = .default
        contnent.badge = 1
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 9, repeats: false)
        guard  let path  = Bundle.main.path(forResource: "no", ofType: "png") else {
            return
        }
        let url = URL(fileURLWithPath: path)
        do {
            let attachment = try! UNNotificationAttachment(identifier: "no", url: url, options: nil)
                   contnent.attachments = [attachment]
        }
        catch {
            print("ERROR: Attachment")
        }
        let request = UNNotificationRequest(identifier: "identifi", content: contnent, trigger: trigger)
        notificationCentre.add(request) { (ERROR) in
            if let errore = ERROR {
                print("ERROR:::\(errore.localizedDescription)" )
            }
        }
    }
    
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound])
    }
}

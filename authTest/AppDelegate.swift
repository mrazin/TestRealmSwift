//
//  AppDelegate.swift
//  authTest
//
//  Created by WSR on 07/11/2019.
//  Copyright © 2019 WSR. All rights reserved.
//

import UIKit
import RealmSwift
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    
let realm = try! Realm()
    var arrayImg: [String] = ["a","b","c","d","e"]
    var arrayName: [String] = ["Аляскинский кли-кай","Бриар","Левретка","Папильон","Японский хин"]
    var id: Int = 0
    var flag: Bool = true
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        if let idU: Int = UserDefaults.standard.integer(forKey: "id") {
            id = idU
        }
    
        if let fl: Bool = UserDefaults.standard.bool(forKey: "flagApp") {
                   flag = fl
               }
        
//        if flag == true {
            for i in 0..<arrayImg.count {
                let newPoroda = Poroda()
                newPoroda.id = String(id)
                id += 1
                UserDefaults.standard.set(id, forKey: "id")
                newPoroda.name = arrayName[i]
                newPoroda.image = arrayImg[i]
                try! realm.write {
                    realm.add(newPoroda)
                }
            }
//            flag = false
//            UserDefaults.standard.set(flag, forKey: "flag")
//        } else {
//            print("LOOOOL")
//        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}


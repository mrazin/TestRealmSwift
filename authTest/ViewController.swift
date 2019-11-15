//
//  ViewController.swift
//  authTest
//
//  Created by WSR on 07/11/2019.
//  Copyright © 2019 WSR. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import UserNotifications
class ViewController: UIViewController {

    @IBOutlet weak var switchOut: UISwitch!
    @IBOutlet weak var userText: UITextField!
    @IBOutlet weak var passText: UITextField!
    @IBOutlet weak var authButton: UIButton!
    
 
    let notification = Notification()
    var username = ""
    var password = ""
    var toke = ""
    var uiSwitch  = false
 
    override func viewDidLoad() {
        super.viewDidLoad()
        notification.notificationCentre.delegate = notification
        if let fl: Bool = UserDefaults.standard.bool(forKey: "switch") {
                          uiSwitch = fl
                      }
        
        switchOut.isOn = uiSwitch
        // Do any additional setup after loading the view.
    }

    @IBAction func authAction(_ sender: Any) {
          
        username = userText.text!
        password = passText.text!
        let flag = logpass(name: username, pass: password)
        if flag == true {
               let url = "http://api.areas.su/login?username=\(username)&password=\(password)"
                      Alamofire.request(url, method: .post).validate().responseJSON { response in
                          switch response.result {
                          case .success(let value):
                              let json = JSON(value)
                              self.toke = json["notice"]["token"].stringValue
                              if self.toke != "" {
//                                         UserDefaults.standard.set(self.toke, forKey: "tok")
                                    self.alert(title: "Успешно", mess: "Вы вошли")
                                  } else {
                                    self.alert(title: "Error", mess: "User is active")

                              }

                              print("JSON: \(json)")
                          case .failure(let error):
                            self.alert(title: "Ошибка", mess: "Неверный логин или пароль.")
                              print(error)
                          }
                      }
           } else {
            alert(title: "Ошибка", mess: "Введите логин и пароль")
           }
    }
    
    
   
    @IBAction func notificationAction(_ sender: Any) {
     notification.requestAuth()
        sleep(3)
        if switchOut.isOn == true {
            uiSwitch = true
            UserDefaults.standard.set(uiSwitch, forKey: "switch")
          
            notification.notification()
        } else {
            uiSwitch = false
                       UserDefaults.standard.set(uiSwitch, forKey: "switch")
            UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        }
    }
    

    
   
    
    
    func logpass(name: String, pass: String) -> Bool  {
           if name != "" && pass != "" {
               return true
           } else {
               return false
           }
       }
    
    
    func alert(title: String, mess: String) {
        let alert = UIAlertController(title: title, message: mess, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func logoutAction(_ sender: Any) {
        username = userText.text!
        let url = "http://api.areas.su/logout?username=\(username)"
                        Alamofire.request(url, method: .post).validate().responseJSON { response in
                            switch response.result {
                            case .success(let value):
                                let json = JSON(value)
                                self.toke = ""
                                self.alert(title: "Успешно", mess: "")
                                print("JSON: \(json)")
                            case .failure(let error):
                                print(error)
                            }
                        }
    }
}


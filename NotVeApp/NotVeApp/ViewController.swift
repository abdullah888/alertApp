//
//  ViewController.swift
//  NotVeApp
//
//  Created by abdullah on 02/01/1442 AH.
//  Copyright © 1442 abdullah. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    @IBOutlet weak var ImageView: UIImageView!

    @IBOutlet weak var TitleTextField: UITextField!
    
    @IBOutlet weak var BodyTextField: UITextField!
    
    
   
    override func viewDidLoad() {
           super.viewDidLoad()
        ImageView.layer.cornerRadius = 00
       }
    
    
    
    
    
    
    @IBAction func ButtonAction(_ sender: Any) {
     
            let MyNotification = UNMutableNotificationContent()
                MyNotification.title = TitleTextField.text!
                MyNotification.badge = 1
                MyNotification.body = BodyTextField.text!
                
                MyNotification.categoryIdentifier = "abdullahapp"
            
               //  لما تريد الاشعارات تكون بالثواني//
                let notificationTime = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                let requset = UNNotificationRequest(identifier: "one", content: MyNotification, trigger: notificationTime)
                UNUserNotificationCenter.current().add(requset) { (Error) in }
            
              
        //هنا استخدم معاه DatePicker //
        
//        let newComponents = Calendar.current.dateComponents([.year , .month , .hour , .minute], from: (sender as AnyObject).date)
//            let notificationTime = UNCalendarNotificationTrigger(dateMatching: newComponents, repeats: false)
//                let requset = UNNotificationRequest(identifier: "one", content: MyNotification, trigger: notificationTime)
//                UNUserNotificationCenter.current().add(requset) { (Error) in }
            }


        }
         
extension ViewController : UNUserNotificationCenterDelegate {
            
            func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
                completionHandler([.alert , .sound])
            }
            
            func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
                
                if response.actionIdentifier == "ActionOne" {
                    self.view.backgroundColor = UIColor.red
                } else if response.actionIdentifier == "ActionTwo" {
                    self.view.backgroundColor = UIColor.blue
                }
                
                
            }
            
            
        }


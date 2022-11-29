//
//  SignupView.swift
//  bank
//
//  Created by Aamer Essa on 29/11/2022.
//

import UIKit
import CoreData
class SignupView: UIViewController {
    
   
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var birthdateLabel: UIDatePicker!
    @IBOutlet weak var phoneNumberLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var namLabel: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func signup(_ sender: UIButton) {
        
        // create new user
        let newUser = Users(context: managedObjectContext)
        newUser.id = UUID() // Generate a Random Unique Identifier
        newUser.name = namLabel.text
        newUser.email = emailLabel.text
        newUser.password = passwordLabel.text
        newUser.phone_number = phoneNumberLabel.text
        newUser.brithdate = birthdateLabel.date
        
        // create new account
        let newAccount = Account(context: managedObjectContext)
        let genreateID = Int.random(in: 100000...999999999999)
        newAccount.id = Int64(genreateID) 
        newAccount.balance = "\(Int.random(in: 1...10000)) SAR"
        newAccount.onweID = newUser.id
        
        // create new card
        
        let cuurentDate = Date()
        var dateComponent = DateComponents()
        dateComponent.year = Int.random(in: 1...5)  // add more years to cureent date (maximum 5 yers)
        let newCard = Card(context: managedObjectContext)
        let genreateCardNumber = Int.random(in: 100000000000...999999999999)
        newCard.name = newUser.name
        newCard.owner = newUser.id
        newCard.number = Int64(genreateCardNumber)
        newCard.cvv = Int16(Int.random(in: 100...999))
        newCard.exp_date = Calendar.current.date(byAdding: dateComponent, to: cuurentDate) 
        
       
        do{
            try managedObjectContext.save()
            print(newUser)
            print(newAccount)
            print(newCard)
        } catch {
            print("\(error)")
        }
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound]) {  authorized, error in
            if authorized {
                self.generateNotification(name: newUser.name!)
            }
        } // end of UNUserNotificationCenter
        
        
        dismiss(animated: true)
    }
    
    
    func generateNotification(name:String){
        
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = "Wellcome to AMD Bank"
        notificationContent.body = "Dear \(name)thank you to join us "
        notificationContent.sound = .default
        
        let notificationTrigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(1), repeats: false)
        
        let request = UNNotificationRequest(identifier: "test", content: notificationContent, trigger: notificationTrigger)
        UNUserNotificationCenter.current().add(request)
        
    } // end of generateNotification
    
    
 

}

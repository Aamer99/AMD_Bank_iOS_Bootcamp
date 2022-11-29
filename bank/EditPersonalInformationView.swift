//
//  EditPersonalInformationView.swift
//  bank
//
//  Created by Aamer Essa on 30/11/2022.
//

import UIKit
import CoreData 
class EditPersonalInformationView: UIViewController {

    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext // connect to DB
    
    @IBOutlet weak var brithdateLabel: UIDatePicker!
    @IBOutlet weak var phoneNumberLabel: UITextField!
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var fullNameLabel: UITextField!
    
    var fullName = String()
    var email = String()
    var phonenumber = String()
    var brithdate = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fullNameLabel.text = fullName
        phoneNumberLabel.text = phonenumber
        emailLabel.text = email
        brithdateLabel.date = brithdate
    }
    

    @IBAction func onClcikSubmit(_ sender: Any) {
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        var users = [Users]()
        
        do{
            let resualt = try managedObjectContext.fetch(request)
              users = resualt as! [Users]
            for users in users {
                if users.email == email && users.name == fullName {
                    users.name = fullNameLabel.text!
                    users.email = emailLabel.text!
                    users.phone_number = phoneNumberLabel.text!
                    users.brithdate = brithdateLabel.date
                   try managedObjectContext.save()
                } // end of if
                
            } // end of for
            
            } catch {
                print("\(error)")
            }// catch
        
        
         let alert = UIAlertController(title: "Success", message: "please login again",
            preferredStyle: UIAlertController.Style.alert)
        
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { handler in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let loginView = storyboard.instantiateViewController(withIdentifier: "LoginView")
            loginView.modalPresentationStyle = .fullScreen
            self.present(loginView, animated: true)
        }))
        
        self.present(alert, animated: true)
        
    } // onClcikSubmit()
   

}

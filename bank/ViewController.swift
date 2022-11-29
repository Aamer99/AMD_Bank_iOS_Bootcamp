//
//  ViewController.swift
//  bank
//
//  Created by mohammed alsaad on 29/11/2022.
//

import UIKit
import CoreData
class ViewController: UIViewController {

    
    @IBOutlet weak var massageError: UILabel!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var emailLabel: UITextField!
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext // connect to DB
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        massageError.isHidden = true
    }
    
    @IBAction func moveToSignUp(_ sender: Any) {
        
      let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let signupView = storyBoard.instantiateViewController(withIdentifier: "SignupView")
        signupView.modalPresentationStyle = .fullScreen
        present(signupView, animated: true)
        
    }
    

    @IBAction func Singin(_ sender: Any) {
        
        let requestUsers = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        let requestAccounts = NSFetchRequest<NSFetchRequestResult>(entityName: "Account")
        let requestCards = NSFetchRequest<NSFetchRequestResult>(entityName: "Card")
        var users = [Users]()
        var accounts = [Account]()
        var cards = [Card]()
       
        do{
        
            let usersResualt = try managedObjectContext.fetch(requestUsers)
            let acountResalt = try managedObjectContext.fetch(requestAccounts)
            let CardResalt = try managedObjectContext.fetch(requestCards)
              users = usersResualt as! [Users]
              accounts = acountResalt as! [Account]
              cards = CardResalt as! [Card]
            
            
            for users in users {
                if users.email == emailLabel.text && users.password == passwordLabel.text {
                    
                    for account in accounts {
                        if account.onweID == users.id {
                            for card in cards {
                                if card.owner == users.id {
                                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                    let accountView = storyboard.instantiateViewController(withIdentifier: "HomeView") as! AccountView
                                    accountView.userId = users.id!
                                    accountView.userName = users.name!
                                    accountView.userEmail = users.email!
                                    accountView.userPhneNumber = users.phone_number!
                                    accountView.userBrithdate = users.brithdate!
                                    accountView.accountBalance = account.balance!
                                    accountView.accountID = String(account.id)
                                    accountView.cardExp = card.exp_date!
                                    accountView.cardNumber = String(card.number)
                                    accountView.cardName = card.name!
                                    accountView.modalPresentationStyle = .fullScreen
                                    present(accountView, animated: true)
                                    break
                                }
                            }
                        }
                    }
                    
                } else {
                    massageError.isHidden = false
                }
             }
        } catch {
            print("\(error)")
        }
    }
    
   
}


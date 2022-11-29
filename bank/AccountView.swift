//
//  HomeView.swift
//  bank
//
//  Created by Aamer Essa on 29/11/2022.
//

import UIKit

class AccountView: UIViewController {

    @IBOutlet weak var label: UILabel!
   
    @IBOutlet weak var cardNumberLabel: UILabel!
    @IBOutlet weak var cardNameLabel: UILabel!
    @IBOutlet weak var accountBalanceLabel: UILabel!
    @IBOutlet weak var accountIdLabel: UILabel!
    @IBOutlet weak var wellcomeMassage: UILabel!
    @IBOutlet weak var cardExpDate: UILabel!
    var userName = String()
    var userEmail = String()
    var userPhneNumber = String()
    var userId = UUID()
    var userBrithdate = Date()
    var accountID = String()
    var accountBalance = String()
    var cardName = String()
    var cardNumber = String()
    var cardExp = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let formatedDate = DateFormatter()
        formatedDate.dateFormat = "MM/yy"
        wellcomeMassage.text = "Welcome back \(userName)"
        accountIdLabel.text = accountID
        accountBalanceLabel.text = accountBalance
        cardNameLabel.text = cardName
        cardNumberLabel.text = cardNumber
        cardExpDate.text = formatedDate.string(from: cardExp)
    }
    

    @IBAction func onClickAcountBtn(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let personalInfoView = storyBoard.instantiateViewController(withIdentifier: "PersonalInfoView") as! PersonalInfoView
        
        
        personalInfoView.name = userName
        personalInfoView.email = userEmail
        personalInfoView.phoneNumber = userPhneNumber
        personalInfoView.brithdate =  userBrithdate 
        
        
        personalInfoView.modalPresentationStyle = .fullScreen
        present(personalInfoView, animated: true)
        
    } //onClickAcountBtn
   

}

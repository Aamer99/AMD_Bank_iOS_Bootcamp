//
//  PersonalInfoView.swift
//  bank
//
//  Created by Aamer Essa on 29/11/2022.
//

import UIKit

class PersonalInfoView: UIViewController {

    @IBOutlet weak var labelBrithdate: UILabel!
    @IBOutlet weak var labelEmail: UILabel!
    @IBOutlet weak var labelPhoneNumber: UILabel!
    @IBOutlet weak var labelName: UILabel!
    
    var name = String()
    var email = String()
    var phoneNumber = String()
    var brithdate = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        labelName.text = name
        labelEmail.text = email
        labelBrithdate.text = dateFormatter.string(from: brithdate)
        labelPhoneNumber.text = phoneNumber 
        
    }
    
    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true)
        
    } //goBack()
    
    @IBAction func onClickEditinformation(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let editPersonalInfo = storyboard.instantiateViewController(withIdentifier: "EditPersonalInformation") as! EditPersonalInformationView
        editPersonalInfo.modalPresentationStyle = .fullScreen 
        editPersonalInfo.fullName = name
        editPersonalInfo.email = email
        editPersonalInfo.phonenumber = phoneNumber
        editPersonalInfo.brithdate = brithdate 
        present(editPersonalInfo, animated: true)
        
    } //onClickEditinformation() 
    

}

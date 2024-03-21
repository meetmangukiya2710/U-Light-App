//
//  ForgotPasswordViewController.swift
//  U-Light App
//
//  Created by R95 on 21/03/24.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    
    var array = [UserData]()
    var password = ""
    
    @IBOutlet weak var backButtonOutlet: UIButton!
    @IBOutlet weak var emailOutlet: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        array = DBHelper.userDataArray
        DBHelper.getData()
        design()
    }
    
    @IBAction func newPasswordButtonAction(_ sender: UIButton) {
        DBHelper.getData()
        array = DBHelper.userDataArray
        var userFound = false
        for i in array {
            if emailOutlet.text == i.email{
                userFound = true
                password = i.password
                print("true")
                break
            }
        }
        
        if userFound == true {
            navigate()
        } else {
            alert(title: "Error!", message: "Email is Not Found.")
        }
    }
    
    func navigate() {
        let naviagte = storyboard?.instantiateViewController(identifier: "CreateNewPasswordViewController") as! CreateNewPasswordViewController
        naviagte.password = password
        navigationController?.pushViewController(naviagte, animated: true)
    }
    
    func alert(title: String,message: String){
        let a = UIAlertController(title: title, message: message, preferredStyle: .alert)
        a.addAction(UIAlertAction(title: "Ok", style: .cancel))
        a.addAction(UIAlertAction(title: "Cancel", style: .destructive))
        present(a, animated: true)
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        let navigate = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        
        navigationController?.popViewController(animated: true)
    }
    
    func design() {
        backButtonOutlet.layer.cornerRadius = 12
        backButtonOutlet.layer.borderWidth = 1
        backButtonOutlet.layer.borderColor = UIColor(.gray).cgColor
    }
    
}

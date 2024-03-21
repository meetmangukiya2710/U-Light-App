//
//  CreateNewPasswordViewController.swift
//  U-Light App
//
//  Created by R95 on 21/03/24.
//

import UIKit

class CreateNewPasswordViewController: UIViewController {

    var array = [UserData]()
    var password = ""
    
    @IBOutlet weak var oldPasswordOutlet: UITextField!
    @IBOutlet weak var newPasswordOutlet: UITextField!
    @IBOutlet weak var cNewPasswordOutlet: UITextField!
    @IBOutlet weak var backButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        array = DBHelper.userDataArray
        design()
    }
    
    @IBAction func createNewPasswordAction(_ sender: Any) {
        print(password)
        if oldPasswordOutlet.text == password {
            if newPasswordOutlet.text == cNewPasswordOutlet.text {
                DBHelper.updateData(password: password, newPassword: cNewPasswordOutlet.text ?? "")
                successAlert()
                DBHelper.getData()
            }
            else {
                alert(title: "Error!", message: "Either Any One Password Is Wrong")
            }
        }
        else {
            alert(title: "Error!", message: "Your Old Password is Wrong")
        }
    }
    
    func alert(title: String, message: String) {
        let a = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        a.addAction(UIAlertAction(title: "Ok", style: .default))
        
        present(a, animated: true)
    }
    
    func successAlert() {
        let a = UIAlertController(title: "Password Changed", message: "Successfully Password Changed \n Back to Login Page", preferredStyle: .alert)
        
        a.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
            let navigate = self.storyboard?.instantiateViewController(identifier: "LoginViewController") as! LoginViewController
            
            self.navigationController?.pushViewController(navigate, animated: true)
        }))
        
        present(a, animated: true)
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        let navigate = storyboard?.instantiateViewController(withIdentifier: "ForgotPasswordViewController") as! ForgotPasswordViewController
        
        navigationController?.popViewController(animated: true)
    }
    
    func design() {
        backButtonOutlet.layer.cornerRadius = 12
        backButtonOutlet.layer.borderWidth = 1
        backButtonOutlet.layer.borderColor = UIColor(.gray).cgColor
    }
    
}

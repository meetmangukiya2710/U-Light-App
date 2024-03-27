//
//  RegistrationPageViewController.swift
//  U-Light App
//
//  Created by R95 on 18/03/24.
//

import UIKit

class RegistrationPageViewController: UIViewController {
    
    var a = 0
    
    @IBOutlet weak var userNameTFOutlet: UITextField!
    @IBOutlet weak var emailTFOutlet: UITextField!
    @IBOutlet weak var passwordTFOutlet: UITextField!
    @IBOutlet weak var cPasswordTFOutlet: UITextField!
    @IBOutlet weak var registrationButtonOutlet: UIButton!
    @IBOutlet weak var fstLabelOutlet: UIImageView!
    @IBOutlet weak var secLabelOutlet: UIImageView!
    @IBOutlet weak var thdLabelOutlet: UIImageView!
    @IBOutlet weak var backButtonOutlet: UIButton!
    @IBOutlet weak var hidePasswordButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        design()
        DBHelper.createFile()
        navigationItem.hidesBackButton = true
        passwordTFOutlet.isSecureTextEntry = true
        cPasswordTFOutlet.isSecureTextEntry = true
    }
    
    @IBAction func registrationButtonAction(_ sender: UIButton) {
        if userNameTFOutlet.text == "" && emailTFOutlet.text == "" && passwordTFOutlet.text == "" && cPasswordTFOutlet.text == "" {
            alert(title: "Error!", message: "Fill All Detail")
        }
        else if userNameTFOutlet.text == "" {
            alert(title: "Error!", message: "Enter the User Name")
        }
        else if emailTFOutlet.text == "" {
            alert(title: "Error!", message: "Enter the E-mail")
        }
        else if passwordTFOutlet.text == "" {
            alert(title: "Error!", message: "Enter the Password")
        }
        else if cPasswordTFOutlet.text == "" {
            alert(title: "Error!", message: "Enter the Cnfrom Password")
        }
        else if passwordTFOutlet.text != cPasswordTFOutlet.text {
            alert(title: "Error!", message: "Eigher Any One Password Is Encorrect.")
        }
        else {
            DBHelper.addData(email: emailTFOutlet.text ?? "", password: cPasswordTFOutlet.text ?? "")
            loginAlert()
        }
    }
    
    func alert(title: String,message: String){
        let a = UIAlertController(title: title, message: message, preferredStyle: .alert)
        a.addAction(UIAlertAction(title: "Ok", style: .cancel))
        a.addAction(UIAlertAction(title: "Cancel", style: .destructive))
        present(a, animated: true)
    }
    
    func loginAlert(){
        let a = UIAlertController(title: "Successfully", message: "Your E-mail Was Register.", preferredStyle: .alert)
        a.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { _ in
            let navigate = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            self.navigationController?.pushViewController(navigate, animated: true)
        }))
        present(a, animated: true)
    }
    
    
    @IBAction func backButtonAction(_ sender: Any) {
        let navigate = storyboard?.instantiateViewController(withIdentifier: "StartViewController") as! StartViewController
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func hidePasswordButtonAction(_ sender: Any) {
        if a == 0 {
            hidePasswordButtonOutlet.setImage(UIImage(systemName: "eye.slash"), for: .normal)
            passwordTFOutlet.isSecureTextEntry = true
            cPasswordTFOutlet.isSecureTextEntry = true
            a = 1
        }
        else {
            hidePasswordButtonOutlet.setImage(UIImage(systemName: "eye"), for: .normal)
            passwordTFOutlet.isSecureTextEntry = false
            cPasswordTFOutlet.isSecureTextEntry = false
            a = 0
        }
    }
    
    func design() {
        registrationButtonOutlet.layer.cornerRadius = 8
        registrationButtonOutlet.layer.borderWidth = 2
        registrationButtonOutlet.layer.borderColor = UIColor(.white).cgColor
        
        fstLabelOutlet.layer.borderWidth = 1
        fstLabelOutlet.layer.cornerRadius = 8
        fstLabelOutlet.layer.borderColor = UIColor(.black).cgColor
        
        secLabelOutlet.layer.borderWidth = 1
        secLabelOutlet.layer.cornerRadius = 8
        secLabelOutlet.layer.borderColor = UIColor(.black).cgColor
        
        thdLabelOutlet.layer.borderWidth = 1
        thdLabelOutlet.layer.cornerRadius = 8
        thdLabelOutlet.layer.borderColor = UIColor(.black).cgColor
        
        backButtonOutlet.layer.cornerRadius = 12
        backButtonOutlet.layer.borderWidth = 1
        backButtonOutlet.layer.borderColor = UIColor(.gray).cgColor
    }
    
   
}

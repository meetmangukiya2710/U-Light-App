//
//  LoginViewController.swift
//  U-Light App
//
//  Created by R95 on 28/12/23.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var EmailOutlet: UITextField!
    
    @IBOutlet weak var PasswordOutlet: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func LoginButtonAction(_ sender: UIButton) {
        if EmailOutlet.text == "" && PasswordOutlet.text == "" {
            Alert(title: "Error!", message: "Fill All Detail")
        }
        else if EmailOutlet.text == "" {
            Alert(title: "Error!", message: "Enter the Email")
        }
        else if PasswordOutlet.text == "" {
            Alert(title: "Error!", message: "Enter the Password")
        }
        else {
            
        }
    }
    
    func Alert(title: String,message: String){
        let a = UIAlertController(title: title, message: message, preferredStyle: .alert)
        a.addAction(UIAlertAction(title: "Ok", style: .cancel))
        a.addAction(UIAlertAction(title: "Cancel", style: .destructive))
        present(a, animated: true)
    }
    
}

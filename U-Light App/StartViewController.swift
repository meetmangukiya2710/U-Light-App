//
//  StartViewController.swift
//  U-Light App
//
//  Created by R95 on 18/03/24.
//

import UIKit

class StartViewController: UIViewController {
    
    
    @IBOutlet weak var loginButtonOutlet: UIButton!
    @IBOutlet weak var regisrationButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        design()
    }
    
    func design() {
        regisrationButtonOutlet.layer.cornerRadius = 8
        
        
        loginButtonOutlet.layer.cornerRadius = 8
        loginButtonOutlet.layer.borderWidth = 2
        loginButtonOutlet.layer.borderColor = UIColor(.black).cgColor
    }
    
    
    @IBAction func loginButtonAction(_ sender: Any) {
        let navigate = storyboard?.instantiateViewController(identifier: "LoginViewController") as! LoginViewController
        
        navigationController?.pushViewController(navigate, animated: true)
    }
    
    
    @IBAction func guestAccountBuutonAction(_ sender: Any) {
        let navigate = storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
        
        navigationController?.pushViewController(navigate, animated: true)
        
    }
    
    @IBAction func registrationButtonAction(_ sender: Any) {
        let navigate = storyboard?.instantiateViewController(identifier: "RegistrationPageViewController") as! RegistrationPageViewController
        
        navigationController?.pushViewController(navigate, animated: true)
    }
    
}

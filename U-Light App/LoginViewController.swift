//
//  LoginViewController.swift
//  U-Light App
//
//  Created by R95 on 28/12/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    var array = [UserData]()

    @IBOutlet weak var emailOutlet: UITextField!
    @IBOutlet weak var passwordOutlet: UITextField!
    @IBOutlet weak var fstLabelOutlet: UIImageView!
    @IBOutlet weak var secLabelOutlet: UIImageView!
    @IBOutlet weak var thdLabelOutlet: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        array = DBHelper.userDataArray
//        DBHelper.getData()
            design()
    }
    
    
    @IBAction func LoginButtonAction(_ sender: UIButton) {
        DBHelper.getData()
        array = DBHelper.userDataArray
        var userFound = false
        for i in array {
        
            if emailOutlet.text == i.email && passwordOutlet.text == i.password {
                userFound = true
                print("true")
                break
            }
        }
        
        if userFound == true {
            navigate()
        } else {
            registertion()
        }
    }
    
    func navigate() {
        let naviagte = storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
        
        navigationController?.pushViewController(naviagte, animated: true)
    }
    
    func alert(title: String,message: String){
        let a = UIAlertController(title: title, message: message, preferredStyle: .alert)
        a.addAction(UIAlertAction(title: "Ok", style: .cancel))
        a.addAction(UIAlertAction(title: "Cancel", style: .destructive))
        present(a, animated: true)
    }
    
    func registertion(){
        let a = UIAlertController(title: "Error!", message: "your Email is Not Found.\n Please Registration your Acount", preferredStyle: .alert)
        a.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { _ in
            let navigate = self.storyboard?.instantiateViewController(identifier: "RegistrationPageViewController") as! RegistrationPageViewController
            
            self.navigationController?.pushViewController(navigate, animated: true)
        }))
        present(a, animated: true)
    }
    
    func design() {
        fstLabelOutlet.layer.borderWidth = 1
        fstLabelOutlet.layer.cornerRadius = 8
        fstLabelOutlet.layer.borderColor = UIColor(.black).cgColor
        
        secLabelOutlet.layer.borderWidth = 1
        secLabelOutlet.layer.cornerRadius = 8
        secLabelOutlet.layer.borderColor = UIColor(.black).cgColor
        
        thdLabelOutlet.layer.borderWidth = 1
        thdLabelOutlet.layer.cornerRadius = 8
        thdLabelOutlet.layer.borderColor = UIColor(.black).cgColor
    }
    
}

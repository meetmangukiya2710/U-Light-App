//
//  LoginViewController.swift
//  U-Light App
//
//  Created by R95 on 28/12/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    var array = [UserData]()
    var count = 0
    
    @IBOutlet weak var emailOutlet: UITextField!
    @IBOutlet weak var passwordOutlet: UITextField!
    @IBOutlet weak var fstLabelOutlet: UIImageView!
    @IBOutlet weak var secLabelOutlet: UIImageView!
    @IBOutlet weak var thdLabelOutlet: UIImageView!
    @IBOutlet weak var backButtonOutlet: UIButton!
    @IBOutlet weak var hidePasswordButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        array = DBHelper.userDataArray
        DBHelper.getData()
        design()
        navigationItem.hidesBackButton = true
        passwordOutlet.isSecureTextEntry = true
        
        
        
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
        //        UserDefaults.standard.set(true, forKey: "Login")
        navigationController?.pushViewController(naviagte, animated: true)
        
        //        if UserDefaults.standard.bool(forKey: "Login") == true {
        //            let vc = self.storyboard?.instantiateViewController(identifier: "ViewController")
        //            self.navigationController?.pushViewController(vc!, animated: false)
        //        }
    }
    
    func alert(title: String,message: String){
        let a = UIAlertController(title: title, message: message, preferredStyle: .alert)
        a.addAction(UIAlertAction(title: "Ok", style: .cancel))
        a.addAction(UIAlertAction(title: "Cancel", style: .destructive))
        
        self.present(a, animated: true, completion: {
            a.view.superview?.isUserInteractionEnabled = true
            a.view.superview?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissOnTapOutside)))
        })
    }
    
    func registertion(){
        let a = UIAlertController(title: "Error!", message: "your Email is Not Found.\n Please Registration your Acount", preferredStyle: .alert)
        a.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { _ in
            let navigate = self.storyboard?.instantiateViewController(identifier: "RegistrationPageViewController") as! RegistrationPageViewController
            
            self.navigationController?.pushViewController(navigate, animated: true)
        }))
        a.addAction(UIAlertAction(title: "Cancel", style: .destructive))
        present(a, animated: true, completion: {
            a.view.superview?.isUserInteractionEnabled = true
            a.view.superview?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissOnTapOutside)))
        })
    }
    
    @objc func dismissOnTapOutside(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        let navigate = storyboard?.instantiateViewController(withIdentifier: "StartViewController") as! StartViewController
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func forgotPasswordButtonAction(_ sender: UIButton) {
        let navigate = storyboard?.instantiateViewController(withIdentifier: "ForgotPasswordViewController") as! ForgotPasswordViewController
        
        navigationController?.pushViewController(navigate, animated: true)
    }
    
    @IBAction func hidePasswordButtonAction(_ sender: Any) {
        if count == 0 {
            hidePasswordButtonOutlet.setImage(UIImage(systemName: "eye.slash"), for: .normal)
            passwordOutlet.isSecureTextEntry = true
            count = 1
        }
        else {
            hidePasswordButtonOutlet.setImage(UIImage(systemName: "eye"), for: .normal)
            passwordOutlet.isSecureTextEntry = false
            count = 0
        }
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
        
        backButtonOutlet.layer.cornerRadius = 12
        backButtonOutlet.layer.borderWidth = 1
        backButtonOutlet.layer.borderColor = UIColor(.gray).cgColor
    }
    
}

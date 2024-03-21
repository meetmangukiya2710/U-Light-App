//
//  NewProductViewController.swift
//  U-Light App
//
//  Created by R95 on 28/12/23.
//

import UIKit

class NewProductViewController: UIViewController {

    
    @IBOutlet weak var NewProdect_Image: UIImageView!
    @IBOutlet weak var NewProduct_Name: UILabel!
    @IBOutlet weak var NewProduct_Price: UILabel!
    @IBOutlet weak var backButtonOutlet: UIButton!
    
    var Img = UIImage(named: "")
    var lab1 = ""
    var lab2 = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NewProdect_Image.image = Img
        NewProduct_Name.text = lab1
        NewProduct_Price.text = lab2
        navigationItem.hidesBackButton = true
        design()
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        let navigat = storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
        
        navigationController?.popViewController(animated: true)
    }
    
    
    func design() {
        backButtonOutlet.layer.cornerRadius = 12
        backButtonOutlet.layer.borderWidth = 1
        backButtonOutlet.layer.borderColor = UIColor(.gray).cgColor
    }
   
}

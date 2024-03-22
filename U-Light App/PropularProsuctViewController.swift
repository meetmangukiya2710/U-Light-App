//
//  PropularProsuctViewController.swift
//  U-Light App
//
//  Created by R95 on 28/12/23.
//

import UIKit

class PropularProsuctViewController: UIViewController {
    
    
    @IBOutlet weak var propularProduct_Image: UIImageView!
    @IBOutlet weak var propularProduct_Name: UILabel!
    @IBOutlet weak var backButtonOutlet: UIButton!
    
    var Img1 = UIImage(named: "")
    var label1 = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        propularProduct_Image.image = Img1
        propularProduct_Name.text = label1
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

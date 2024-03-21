//
//  PropularProsuctViewController.swift
//  U-Light App
//
//  Created by R95 on 28/12/23.
//

import UIKit

class PropularProsuctViewController: UIViewController {
    
    
    @IBOutlet weak var PropularProduct_Image: UIImageView!
    @IBOutlet weak var PropularProduct_Name: UILabel!
    @IBOutlet weak var backButtonOutlet: UIButton!
    
    var Img1 = UIImage(named: "")
    var label = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        PropularProduct_Image.image = Img1
        PropularProduct_Name.text = label
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

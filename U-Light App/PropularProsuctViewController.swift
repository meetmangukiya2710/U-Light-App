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
    
    var Img1 = UIImage(named: "")
    var label = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        PropularProduct_Image.image = Img1
        PropularProduct_Name.text = label
        
    }
   
}

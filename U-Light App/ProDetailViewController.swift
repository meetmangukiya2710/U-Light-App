//
//  ProDetailViewController.swift
//  U-Light App
//
//  Created by R95 on 27/12/23.
//

import UIKit

class ProDetailViewController: UIViewController {
    
    
    @IBOutlet weak var Image: UIImageView!
    
    
    @IBOutlet weak var label1: UILabel!
    
    
    @IBOutlet weak var label2: UILabel!
    
    var img = UIImage()
    var lab1 = ""
    var lab2 = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Image.image = img
        label1.text = lab1
        label2.text = lab2
        
    }

}

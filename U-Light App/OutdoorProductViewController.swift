//
//  OutdoorProductViewController.swift
//  U-Light App
//
//  Created by R95 on 27/03/24.
//

import UIKit

class OutdoorProductViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var outdoorProductOutlet: UITableView!
    @IBOutlet weak var backButtonOutlet: UIButton!
    
    var imageProduct = ["Outdoor Lamp","Outdoor Lamp 1","Outdoor Lamp 2","Outdoor Lamp 3","Outdoor Lamp 4","Outdoor Lamp 5","Outdoor Lamp 6","Outdoor Lamp 7","Outdoor Lamp 8","Outdoor Lamp 9"]

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        design()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageProduct.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = outdoorProductOutlet.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! OutdoorProductTableViewCell
        
        cell.outdoorImageOutlet.image = UIImage(named: imageProduct[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 162
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        let navigat = storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
        
        navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func design() {
        backButtonOutlet.layer.cornerRadius = 12
        backButtonOutlet.layer.borderWidth = 1
        backButtonOutlet.layer.borderColor = UIColor(.gray).cgColor
    }
    
}

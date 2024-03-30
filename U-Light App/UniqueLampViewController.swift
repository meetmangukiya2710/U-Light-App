//
//  UniqueLampViewController.swift
//  U-Light App
//
//  Created by R95 on 27/03/24.
//

import UIKit

class UniqueLampViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var uniqueProductOutlet: UITableView!
    @IBOutlet weak var backButtonOutlet: UIButton!

    var imageProduct = ["unique lamp","unique lamp 1","unique lamp 2","unique lamp 3","unique lamp 4","unique lamp 5","unique lamp 6","unique lamp 7","unique lamp 8","unique lamp 9"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        design()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageProduct.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = uniqueProductOutlet.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UniqueLampProductTableViewCell
        
        cell.uniqueImageOutlet.image = UIImage(named: imageProduct[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 162
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

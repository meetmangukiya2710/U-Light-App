//
//  InsideLampViewController.swift
//  U-Light App
//
//  Created by R95 on 27/03/24.
//

import UIKit

class InsideLampViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var insideLampOutlet: UITableView!
    @IBOutlet weak var backButtonOutlet: UIButton!
    
    var array = ["Inside Lamp","Inside Lamp 1","Inside Lamp 2","Inside Lamp 3","Inside Lamp 4","Inside Lamp 5","Inside Lamp 6","Inside Lamp 7","Inside Lamp 8","Inside Lamp 9"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        design()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = insideLampOutlet.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! InsideLampProductTableViewCell
        
        cell.insideImageOutlet.image = UIImage(named: array[indexPath.row])
        
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

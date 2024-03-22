//
//  ViewController.swift
//  U-Light App
//
//  Created by R95 on 26/12/23.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var NewProductOutlet: UICollectionView!
    
    @IBOutlet weak var PropularProductOutlet: UICollectionView!
    
    var Image = ["Product1","Product2","Product3","Product4","Product5","Product6","Product7","Product8","Product9"]
    
    var Image1 = ["Item1","Item2","Item3","Item4","Item5","Item6","Item7","Item8","Item9","Item10","Item11","Item12"]
    
    var ProName = ["3D rendered image of an artistic minimalist lamp","Ceiling lights and black decorations","Tala Alumina Single White Pendant Light","3The lamps are separated from the background.","Decorative Light in the home","Festival decorative string lights hang","Loft style black ceiling lamps with glowing light bulbs.","Loft style black ceiling lamps with glowing light bulbs.","3D rendered image of an artistic minimalist lamp"]
    
    var ProName2 = ["IMNISHNAY Tree Lamp for Baby Room Decor,Pearl LED Fairy Lights Spirit Tree,Bonsai Tree Light","ExclusiveLane Sheesham Wooden 'Pyramid' Table Lamp for Bedroom & Living Room","IMNISHNAY Table Lamp for Bedroom, Minimalist Bedside Table Lamps Night Light with USB Ports","Homesake Wall Light, Wall Lamp Wood Light for Home Decoration, Chandelier Home, Living Room, Indoor Outdoor","GLOWSERIE Led Desk Tree Lamp, Desk Table Decor 36 Pearl LED Lights","ELYZIA Tripping Indoor Outdoor Wall Lamps/Lights lamp led Light Shade/Curved Black","Decor & More - Bedside Lamp | Bed Lamps for Bedroom with On/Off Button | Table Lamps for Home Decoration","Zinnia Night Light for Bedroom, 3D Solar System Crystal Ball Night Lamp, LED Space Projection Table Lamp for Home Decoration & Living-Room","XERGY 10 cm 3D Rechargeable Moon Lamp with Touch Control Adjust Brightness with Wooden"]
    
    var ProPrice = ["$100","$120","$99","$199","$209","$90","$159","$160","$180"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return Image.count
        }else{
            return Image1.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == NewProductOutlet {
            let NewProductCell = NewProductOutlet.dequeueReusableCell(withReuseIdentifier: "NewProductCell", for: indexPath) as! NewProductCollectionViewCell
        
            NewProductCell.newProdectImage.image = UIImage(named: Image[indexPath.row])
            NewProductCell.newProdectName.text = ProName[indexPath.row]
            NewProductCell.newProdectPrice.text = ProPrice[indexPath.row]
            
            return NewProductCell
        }else{
            let PropularProCell = PropularProductOutlet.dequeueReusableCell(withReuseIdentifier: "PropularProCell", for: indexPath) as! PopulerProductCollectionViewCell
            
            PropularProCell.PropularProductImage.image = UIImage(named: Image1[indexPath.row])
            PropularProCell.PropularProductName.text = ProName2[indexPath.row]
            
            return PropularProCell
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 175, height: 333)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == NewProductOutlet{
            let seclect = storyboard?.instantiateViewController(identifier: "NewProductViewController") as! NewProductViewController

            seclect.Img = UIImage(named: Image[indexPath.row])!
            seclect.lab1 = ProName[indexPath.row]
            seclect.lab2 = ProPrice[indexPath.row]

            self.navigationController?.pushViewController(seclect, animated: true)
        }else{
            let seclect1 = storyboard?.instantiateViewController(identifier: "PropularProsuctViewController") as! PropularProsuctViewController

            seclect1.Img1 = UIImage(named: Image1[indexPath.row])!
            seclect1.label1 = ProName2[indexPath.row]
            

            self.navigationController?.pushViewController(seclect1, animated: true)
        }
    }
}


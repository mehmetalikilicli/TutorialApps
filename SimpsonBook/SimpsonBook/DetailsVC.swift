//
//  detailsVC.swift
//  SimpsonBook
//
//  Created by Mehmet Ali Kılıçlı on 15.08.2022.
//

import UIKit

class detailsVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var propertiesLabel: UILabel!
    
    var selectedHoroscope : Horoscope?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = selectedHoroscope?.name
        propertiesLabel.text = selectedHoroscope?.properties
        imageView.image = selectedHoroscope?.image
        
        
        propertiesLabel.lineBreakMode = .byWordWrapping
        propertiesLabel.numberOfLines = 0


    }
    
    
    

    

}

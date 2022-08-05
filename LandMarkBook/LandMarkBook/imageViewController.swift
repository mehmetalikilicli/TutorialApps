//
//  imageViewController.swift
//  LandMarkBook
//
//  Created by Mehmet Ali Kılıçlı on 5.08.2022.
//

import UIKit

class imageViewController: UIViewController {

   
    @IBOutlet weak var landmarkImageView: UIImageView!
    @IBOutlet weak var landmarkLabel: UILabel!
    
    var selectedLandmarkName = ""
    var selectedLandmarkImage = UIImage()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        landmarkLabel.text = selectedLandmarkName
        landmarkImageView.image = selectedLandmarkImage
        

    }
    

    
}

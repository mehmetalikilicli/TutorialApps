//
//  MapVC.swift
//  FourSquareClone
//
//  Created by Mehmet Ali Kılıçlı on 22.08.2022.
//

import UIKit
import MapKit

class MapVC: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(title: "Save", style: UIBarButtonItem.Style.plain, target: self, action: #selector(saveButtonClicked))

        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItem.Style.plain, target: self, action: #selector(backButtonClicked))
        
    }
    
    @objc func saveButtonClicked(){
        //Parse
    }
    @objc func backButtonClicked(){
        self.dismiss(animated: true)
        
    }
    
    
    
    


}

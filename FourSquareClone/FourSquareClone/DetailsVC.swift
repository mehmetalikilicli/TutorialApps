//
//  DetailsVC.swift
//  FourSquareClone
//
//  Created by Mehmet Ali Kılıçlı on 22.08.2022.
//

import UIKit
import MapKit
import Parse
class DetailsVC: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var detailsImageView: UIImageView!
    @IBOutlet weak var detailsPlaceNameLabel: UILabel!
    @IBOutlet weak var detailsPlaceTypeLabel: UILabel!
    @IBOutlet weak var detailsPlaceAtmosphereLabel: UILabel!
    @IBOutlet weak var detailsMapView: MKMapView!
    
    var chosenPlaceId = ""
    
    var chosenLatitude = Double()
    var chosenLongitude = Double()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailsMapView.delegate = self
        getDataFromParse()
    }
    
    
    func getDataFromParse() {
        
        let query = PFQuery(className: "Places")
        
        //OBJECTS
        
        query.whereKey("objectId", equalTo: chosenPlaceId)
        query.findObjectsInBackground { (objects, error) in
            if error != nil {
                
            } else {
                if objects != nil {
                    if objects!.count > 0 {
                        let chosenPlaceObject = objects![0]
                        if let placeName = chosenPlaceObject.object(forKey: "name") as? String {
                            self.detailsPlaceNameLabel.text  = placeName
                        }
                        
                        if let placeType = chosenPlaceObject.object(forKey: "type") as? String {
                            self.detailsPlaceTypeLabel.text  = placeType
                        }
                        
                        if let placeAtmosphere = chosenPlaceObject.object(forKey: "atmosphere") as? String {
                            self.detailsPlaceAtmosphereLabel.text  = placeAtmosphere
                        }
                        
                        if let placeLatitude = chosenPlaceObject.object(forKey: "latitude") as? String {
                            if let placeLatitudeDouble = Double(placeLatitude) {
                                self.chosenLatitude = placeLatitudeDouble
                            }
                        }
                        
                        if let placeLongtitude = chosenPlaceObject.object(forKey: "longitude") as? String {
                            if let placeLongitudeDouble = Double(placeLongtitude) {
                                self.chosenLongitude = placeLongitudeDouble
                            }
                        }
                        
                        if let imageData = chosenPlaceObject.object(forKey: "image") as? PFFileObject {
                            imageData.getDataInBackground { (data,error) in
                                if error == nil {
                                    if data != nil {
                                        self.detailsImageView.image = UIImage(data: data!)
                                    }
                                }
                            }
                        }
                        
                        //MAPS
                        
                        let location = CLLocationCoordinate2D(latitude: self.chosenLatitude, longitude: self.chosenLongitude)
                        
                        let span = MKCoordinateSpan(latitudeDelta: 0.035, longitudeDelta: 0.035)
                        
                        let region = MKCoordinateRegion(center: location, span: span)
                        
                        self.detailsMapView.setRegion(region, animated: true)
                        
                        let annotation = MKPointAnnotation()
                        annotation.coordinate = location
                        annotation.title = self.detailsPlaceNameLabel.text!
                        annotation.title = self.detailsPlaceTypeLabel.text!
                        self.detailsMapView.addAnnotation(annotation)
                        
                        
                        
                    }
                }
            }
        }
        
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            if annotation is MKUserLocation {
                return nil
            }
            
            let reuseId = "pin"
            
            var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId)
            
            if pinView == nil {
                pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
                pinView?.canShowCallout = true
                let button = UIButton(type: .detailDisclosure)
                pinView?.rightCalloutAccessoryView = button
            } else {
                pinView?.annotation = annotation
            }
            
            return pinView
            
        }
        
        
        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
            if self.chosenLongitude != 0.0 && self.chosenLatitude != 0.0 {
                let requestLocation = CLLocation(latitude: self.chosenLatitude, longitude: self.chosenLongitude)
                
                CLGeocoder().reverseGeocodeLocation(requestLocation) { (placemarks, error) in
                    if let placemark = placemarks {
                        
                        if placemark.count > 0 {
                            
                            let mkPlaceMark = MKPlacemark(placemark: placemark[0])
                            let mapItem = MKMapItem(placemark: mkPlaceMark)
                            mapItem.name = self.detailsPlaceNameLabel.text
                            
                            let launchOptions = [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving]
                            
                            mapItem.openInMaps(launchOptions: launchOptions)
                        }
                        
                    }
                }
                
            }
        }

    
}

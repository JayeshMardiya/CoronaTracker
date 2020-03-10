//
//  MapViewController.swift
//  Corona Tracker COVID
//
//  Created by Jayesh Mardiya on 10/03/20.
//  Copyright © 2020 Jayesh Mardiya. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    let annotation = MKPointAnnotation()
    var attribute: Attributes?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mapView.delegate = self
        self.zoomToRegion()
        
        if let mapData = self.attribute, let lat = mapData.lat, let long = mapData.long {
            self.title = "\(mapData.countryRegion ?? "") \(mapData.provinceState ?? "")"
            let location = CLLocationCoordinate2D(latitude: lat, longitude: long)
            annotation.coordinate = location
            mapView.addAnnotation(annotation)
        }
    }
    
    func zoomToRegion() {
        
        if let mapData = self.attribute, let lat = mapData.lat, let long = mapData.long {
            let location = CLLocation(latitude: lat, longitude: long)
            self.centerMapOnLocation(location: location)
        }
    }
}

extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        print("delegate called")
        
        if !(annotation is CustomPointAnnotation) {
            return nil
        }
        
        let reuseId = "test"
        
        var anView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId)
        if anView == nil {
            anView = CustomCalloutView(annotation: annotation, reuseIdentifier: reuseId)
            anView!.canShowCallout = false
        }
        else {
            anView!.annotation = annotation
        }
        
        let cpa = annotation as! CustomPointAnnotation
        
        if let mapData = self.attribute {
            cpa.countryName = "\(mapData.countryRegion ?? "") \(mapData.provinceState ?? "")"
            cpa.confirmed = "\(mapData.confirmed ?? 0)"
            cpa.death = "\(mapData.deaths ?? 0)"
            cpa.recovered = "\(mapData.recovered ?? 0)"
        }
        
        return anView
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude), span: MKCoordinateSpan(latitudeDelta: 5.0, longitudeDelta: 5.0))
        DispatchQueue.main.async {
            self.mapView.setRegion(region, animated: true)
        }
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        
        if view.annotation!.isKind(of: MKUserLocation.self) {
            return
        }
        
        if let mapData = self.attribute, let lat = mapData.lat, let long = mapData.long {
            let location = CLLocation(latitude: lat, longitude: long)
            self.centerMapOnLocation(location: location)
        }
        
        let customView = (Bundle.main.loadNibNamed("CustomCalloutView", owner: self, options: nil))?[0] as! CustomCalloutView
        if let mapData = self.attribute {
            customView.countryName.text = "\(mapData.countryRegion ?? "") \(mapData.provinceState ?? "")"
            customView.confirmed.text = "\(mapData.confirmed ?? 0)"
            customView.death.text = "\(mapData.deaths ?? 0)"
            customView.recovered.text = "\(mapData.recovered ?? 0)"
        }
        let calloutViewFrame = customView.frame;
        customView.frame = CGRect(x: -calloutViewFrame.size.width/2.23, y: -calloutViewFrame.size.height-80, width: 315, height: 200)
        view.addSubview(customView)
    }
    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        for childView: AnyObject in view.subviews {
            
            if childView.isKind(of: CustomCalloutView.self) {
                childView.removeFromSuperview()
            }
        }
    }
}

class CustomPointAnnotation: MKPointAnnotation {
    
    var countryName: String
    var confirmed: String
    var death: String
    var recovered: String
    
    init(countryName: String, confirmed: String, death: String, recovered: String) {
        self.countryName = countryName
        self.confirmed = confirmed
        self.death = death
        self.recovered = recovered
    }
}

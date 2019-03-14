//
//  mapController.swift
//  alyef
//
//  Created by iMac on 2019/03/07.
//  Copyright © 2019 awad. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class mapController: UIViewController,MKMapViewDelegate {
    
    @IBOutlet weak var myMap: MKMapView!
    let locationManager = CLLocationManager()
    var previosLocation:CLLocation = CLLocation()
    ///////////// map view ////////////
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        myMap.delegate = self
        
        checkLocationService()
//        let initialLocation = CLLocation(latitude: 21.282778, longitude: -157.829444)
//        let regionRadius: CLLocationDistance = 1000
//        func centerMapOnLocation(location: CLLocation) {
//            let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
//                                                      latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
//            myMap.setRegion(coordinateRegion, animated: true)
//        }
        
        
//        centerMapOnLocation(location: initialLocation)
        // Do any additional setup after loading the view.
    }
    
    ////////////////////////////////

    @IBAction func amDone(_ sender: Any) {
        print(previosLocation)
    }
    
    
    ////////////////////////////////
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func checkLocationService() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthrization()
        }else {
            
        }
    }
    
    func centerViewOnUserLocation() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: 30000, longitudinalMeters: 30000)
            myMap.setRegion(region, animated: true)
        }
    }
    
    func checkLocationAuthrization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            myMap.showsUserLocation = true
            centerViewOnUserLocation()
            locationManager.stopUpdatingLocation()
            print(gitCenterLocation(for: myMap))
            previosLocation = gitCenterLocation(for: myMap)
        case .denied:
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            break
        case .authorizedAlways:
            break
        }
    }

    func gitCenterLocation(for mapView:MKMapView) -> CLLocation {
        let latitude = mapView.centerCoordinate.latitude
        let longitude = mapView.centerCoordinate.longitude
        
        return CLLocation(latitude: latitude, longitude: longitude)
    }
    
    @IBAction func backToHome(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension mapController:CLLocationManagerDelegate{
    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        guard let location = locations.last else { return }
//        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
//        let region = MKCoordinateRegion.init(center: center, latitudinalMeters: 20000, longitudinalMeters: 20000)
//        myMap.setRegion(region, animated: true)
//    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthrization()
    }
    
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let center = gitCenterLocation(for: mapView)
        
        print(previosLocation)
        
        guard center.distance(from: previosLocation) > 50 else { return }
        
        previosLocation = center
        
//        let geoCoder = CLGeocoder()
//
//        geoCoder.reverseGeocodeLocation(center) { [weak self] (placemarks , error) in
//            guard let self = self else { return }
//
//            if let _ = error {
//                return
//            }
//
//            guard let placemark = placemarks?.first else {
//                return
//            }
//
//        }
    }
}

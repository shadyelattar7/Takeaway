//
//  CurrentLocationVC.swift
//  Takeaway
//
//  Created by Elattar on 12/19/20.
//  Copyright © 2020 Elattar. All rights reserved.
//

import UIKit
import CoreLocation

class CurrentLocationVC: UIViewController {
    
    @IBOutlet weak var viewX: UIView!
    @IBOutlet weak var CurrentLocation_btn: UIButton!
    
    let regionInMeter: Double = 10000
    let locationManager = CLLocationManager()
    
    var latitude = 0.0
    var longitude = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView(){
        viewX.layer.cornerRadius = 30
        viewX.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        CurrentLocation_btn.layer.cornerRadius = 12
    }
    
    
    private func setupLoactionManager(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    
    private func checkLocationService(){
        if CLLocationManager.locationServicesEnabled(){
            setupLoactionManager()
            checkLocationAuthorization()
        }else{
            
        }
    }
    
    func checkLocationAuthorization(){
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
        case .denied:
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            break
        case .authorizedAlways:
            break
        @unknown default:
            print("error")
        }
    }
    
    func getAddressFromLatLon(pdblLatitude: String, withLongitude pdblLongitude: String)   {
        var center : CLLocationCoordinate2D = CLLocationCoordinate2D()
        let lat: Double = Double("\(pdblLatitude)")!
        let lon: Double = Double("\(pdblLongitude)")!
        let ceo: CLGeocoder = CLGeocoder()
        center.latitude = lat
        center.longitude = lon
        
        let loc: CLLocation = CLLocation(latitude:center.latitude, longitude: center.longitude)
        
        ceo.reverseGeocodeLocation(loc, completionHandler:
            {(placemarks, error) in
                if (error != nil)
                {
                    print("reverse geodcode fail: \(error!.localizedDescription)")
                }
                let pm = placemarks! as [CLPlacemark]
                
                if pm.count > 0 {
                    let pm = placemarks![0]
                    
                    var addressString : String = ""
                    if pm.subLocality != nil {
                        addressString = addressString + pm.subLocality! + ", "
                    }
                    if pm.thoroughfare != nil {
                        addressString = addressString + pm.thoroughfare! + ", "
                    }
                    if pm.locality != nil {
                        addressString = addressString + pm.locality! + ", "
                    }
                    if pm.country != nil {
                        addressString = addressString + pm.country! + ", "
                    }
                    if pm.postalCode != nil {
                        addressString = addressString + pm.postalCode! + " "
                    }
                    print(addressString)
                }
        })
    }
    
    
    @IBAction func currentLocation_btn(_ sender: Any) {
        checkLocationService()
        
    }
}
//MARK:- MAP Delegate
extension CurrentLocationVC: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else {return}
        print("Current Location: \(locValue.latitude) , \(locValue.longitude)")
        
        self.latitude = locValue.latitude
        self.longitude = locValue.longitude
        
         getAddressFromLatLon(pdblLatitude: "\(locValue.latitude)", withLongitude: "\(locValue.longitude)")
        
        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
    
}

//
//  ViewController.swift
//  TravelBook
//
//  Created by sys on 1.06.2023.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController,MKMapViewDelegate, CLLocationManagerDelegate {

    
    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // map view Delegasyonunu yapılması
        mapView.delegate = self
        locationManager.delegate = self
        //konumun verisi ne kadar kesin olacak
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //kullanıcıdan izin istememiz gerekiyor -- uygulamayı kullanırken izin istesin
        locationManager.requestWhenInUseAuthorization()
        //kullanıcın yerini belirlemek için
        locationManager.startUpdatingLocation()
        
        // uzun bastığında çağırılacak
        let gestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(chooseLocation(gestureRecognizer:)))
        gestureRecognizer.minimumPressDuration = 3
        mapView.addGestureRecognizer(gestureRecognizer)
        
    }
    @objc func chooseLocation(gestureRecognizer:UILongPressGestureRecognizer) {
            
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //enlem ve boylam ile konumu getirmeye yarıyor
        let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
        // zoom seviyesi
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
    }

}


//
//  ViewController.swift
//  TravelBook
//
//  Created by sys on 1.06.2023.
//

import UIKit
import MapKit

class ViewController: UIViewController,MKMapViewDelegate {

    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // map view Delegasyonunu yapılması
        mapView.delegate = self
    }


}


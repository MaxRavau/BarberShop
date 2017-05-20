//
//  ViewController.swift
//  BarberShop
//
//  Created by Maxime Ravau on 09/05/2017.
//  Copyright © 2017 Maxime Ravau. All rights reserved.
//

import UIKit
import MapKit



class ViewController: UIViewController {

    @IBOutlet var myMapView: MKMapView!
    
    @IBOutlet var labelTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let location =  CLLocationCoordinate2DMake(50.6181156, 3.0611910999999736)
        
        myMapView.setRegion(MKCoordinateRegionMakeWithDistance(location ,1500, 1500), animated: true)
        
        let pin = PinAnnotation(title: "J&J BARBER SHOP", subTitle: "2 place Jacques Febvrier, 59000 LILLE", coordinate: location)
        
        myMapView.addAnnotation(pin)
          
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
    @IBAction func showMeWhere(_ sender: Any) {
        
        let latitude: CLLocationDegrees = 50.6181156
        
        let longitude: CLLocationDegrees = 3.0611910999999736
        
        let regionDistance: CLLocationDistance = 1000
        
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        
        let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, regionDistance, regionDistance)
        
        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
        
        let placemark = MKPlacemark(coordinate: coordinates)
        
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "J&J BARBER SHOP"
        mapItem.openInMaps(launchOptions: options)
        
    }
    

}


//
//  ViewController.swift
//  20160721SwiftMapkit
//
//  Created by Financialbrain on 2016/7/21.
//  Copyright © 2016年 DarisCode. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit


    // Protocol add 1.CLLocationManagerDelegate 2.MKMapViewDelegate
class ViewController: UIViewController,CLLocationManagerDelegate,MKMapViewDelegate
{
    
    // ! mean automatic open the optional
    @IBOutlet weak var mainMapView: MKMapView!
    
    var firstLocationReceived:dispatch_once_t = 0
    
    // () = [CLLocationManager new]
    // Not Need Create in ViewDidLoad
    // Avoid to at runtime to change locatoinManager
    let locatoinManager = CLLocationManager()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /// Ask Permission
        locatoinManager.requestWhenInUseAuthorization()
        
       
        /*Plist
        
         NSLocationWhenInUseUsageDescription
         <string>Take your Location and show on the Map</string>
         
        */
        
        ///Accuracy level
        locatoinManager.desiredAccuracy = kCLLocationAccuracyBest
        ///activity Type
        locatoinManager.activityType = .AutomotiveNavigation
        ///Protocol delegate
        locatoinManager.delegate = self
        ///Stop updating locations
        locatoinManager.startUpdatingLocation()
        ///
        mainMapView.delegate = self
        ///Show the Location point (blue point)
        mainMapView.showsUserLocation = true
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func mapTypeChanged(sender: AnyObject)
    {
        let targetIndex = sender.selectedSegmentIndex
        
        switch targetIndex
        {
        case 0:
            mainMapView.mapType = .Standard
        case 1:
            mainMapView.mapType = .Satellite
        case 2:
            mainMapView.mapType = .Hybrid
        default:
            mainMapView.mapType = .Standard
        }
    }
    @IBAction func mapTrackingMode(sender: AnyObject)
    {
        
        let targetIndex = sender.selectedSegmentIndex
        
        switch targetIndex
        {
        case 0:
            mainMapView.userTrackingMode = .None
        case 1:
            mainMapView.userTrackingMode = .Follow
        case 2:
            mainMapView.userTrackingMode = .FollowWithHeading
        default:
            mainMapView.userTrackingMode = .None
        }
    }
    
    //MARK: - CLLocationManagerDelegate Method
    //TODO: .....
    //FIXME: .....
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
/*

        let currentLocation = locations.last

        if let currentLocation = currentLocation
        {
        print("Lat/Lon:\(currentLocation.coordinate.latitude),\(currentLocation.coordinate.longitude)")
        }
 
*/
        
        
        guard let currentLocation = locations.last else
        {
            print("NO Valid currentLocation")
            return
        }
        
        //print("Lat/Lon:\(currentLocation.coordinate.latitude).\(currentLocation.coordinate.longitude)")
        NSLog("Lat/Lon:\(currentLocation.coordinate.latitude).\(currentLocation.coordinate.longitude)")
        
        //block: dispatch_block_t <-closure
        
        dispatch_once(&firstLocationReceived)
        {//Closure
            let span = MKCoordinateSpanMake(0.001, 0.001)
            let region = MKCoordinateRegionMake(currentLocation.coordinate, span)
            //Swift closure so need to add "self"
            self.mainMapView.setRegion(region, animated: true)
            
            // Add Anootation
            var annotationCoordinate = currentLocation.coordinate
            annotationCoordinate.latitude += 0.0001
            annotationCoordinate.latitude += 0.0001
            
            // MKPointAnnotation is a Data Object
            let annotation = MKPointAnnotation()
            annotation.coordinate = annotationCoordinate
            annotation.title = "KFC"
            annotation.subtitle = "Good"
            
            self.mainMapView.addAnnotation(annotation)
        }
    }
    
    //MARK: - MKMapViewDelegate Methods
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView?
    {
        //[annotation isKindOfClass:[MKUserLocation class]]
        if annotation is MKUserLocation
        {
            return nil
        }
        
        let reuseId = "store"
        // as! means class transform
        var result = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId)
//            as? MKPinAnnotationView
        //  if result == nil then create one
        if result == nil
        {
            //Pin Version
//          result = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            
            //Non-Pin Version
            result = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
        }
        else
        {
            result?.annotation = annotation
        }
        result?.canShowCallout = true
        
        //Left ImageView
        
        let image = UIImage(named: "pointRed.png")
        result?.leftCalloutAccessoryView = UIImageView(image: image)
        
        //Right Buton
        let button = UIButton(type: .DetailDisclosure)
        //
        // OBJC:@selector(...)
        //
        button.addTarget(self, action: #selector(ViewController.buttonTapped), forControlEvents:.TouchUpInside)
        
        result?.rightCalloutAccessoryView = button
        //Use your image
        result?.image = image
        
        return result
    }
    
    func buttonTapped()
    {
        let alert = UIAlertController(title: nil, message: "Button Tapped", preferredStyle: .Alert)
        let ok = UIAlertAction(title: "OK", style: .Default, handler: nil)
        let cancel = UIAlertAction(title: "Cancel", style: .Destructive, handler: nil)
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        self.presentViewController(alert, animated: true, completion: nil)
       
        
    }
}

//
//  MapViewController.swift
//  SGP_TermProject
//
//  Created by kpugame on 2019. 6. 1..
//  Copyright © 2019년 JEONGUN JO. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var posts = NSMutableArray()
    
    let regionRadius: CLLocationDistance = 10000
    
    func centerMapOnLocation(location: CLLocation){
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    var kidergartens : [Kidergarten] = []
    
    func loadInitialData() {
        for post in posts {
            let chidName = (post as AnyObject).value(forKey: "FACLT_NM") as! NSString as String
            let chidAddr = (post as AnyObject).value(forKey: "REFINE_ROADNM_ADDR") as! NSString as String
            let posx = (post as AnyObject).value(forKey: "REFINE_WGS84_LAT") as! NSString as String
            let posy = (post as AnyObject).value(forKey: "REFINE_WGS84_LOGT") as! NSString as String
            let lat = (posx as NSString).doubleValue
            let lon = (posy as NSString).doubleValue
            let kidergarten = Kidergarten(title: chidName, locationName: chidAddr, coordinate: CLLocationCoordinate2D(latitude: lat, longitude: lon))
            kidergartens.append(kidergarten)
        }
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl){
        let location = view.annotation as! Kidergarten
        let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
        location.mapItem().openInMaps(launchOptions: launchOptions)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?{
        guard let annotation = annotation as? Kidergarten else { return nil }
        let identifier = "marker"
        var view: MKMarkerAnnotationView
        
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            as? MKMarkerAnnotationView{
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else{
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let initialLocation = CLLocation(latitude: 37.2669636, longitude: 126.9922507)
        centerMapOnLocation(location: initialLocation)
        mapView.delegate = self
        
        loadInitialData()
        mapView.addAnnotations(kidergartens)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

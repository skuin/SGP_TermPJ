//
//  Kidergarten.swift
//  SGP_TermProject
//
//  Created by kpugame on 2019. 6. 2..
//  Copyright © 2019년 JEONGUN JO. All rights reserved.
//

import Foundation
import MapKit
import Contacts

class Kidergarten: NSObject, MKAnnotation{
    let title: String?
    let locationName: String
    var coordinate: CLLocationCoordinate2D
    
    init(title: String, locationName: String, coordinate: CLLocationCoordinate2D){
        self.title = title
        self.locationName = locationName
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }
    
    func mapItem() -> MKMapItem{
        let addreassDict = [CNPostalAddressStreetKey: subtitle!]
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addreassDict)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = title
        return mapItem
    }
}

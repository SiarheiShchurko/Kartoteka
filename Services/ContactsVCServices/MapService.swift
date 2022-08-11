//
//  MapService.swift
//  KartotekaApp (Project)
//
//  Created by Alinser Shchurko on 17.07.22.
//

import UIKit
import MapKit


final class MapService {
    //MARK - MapService
    func mapService(_ map: MKMapView) {
    let location = CLLocationCoordinate2DMake(53.873646, 27.558025)
    let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
    let region = MKCoordinateRegion(center: location, span: span)
    map.setRegion(region, animated: true)
    let annotation = MKPointAnnotation()
    annotation.coordinate = location
    annotation.title = "ООО Картотека"
    annotation.subtitle = "Аэродромная ул. 125, Минск"
    map.addAnnotation(annotation)
        
}
}



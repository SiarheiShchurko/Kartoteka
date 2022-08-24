//
//  ContactsVM.swift
//  Kartoteka.by
//
//  Created by Alinser Shchurko on 16.08.22.
//

import Foundation
import MapKit

protocol ContactsProtocol {
    
    var user: ModelUser? { get set }
    func sentMessage()
    func mapService(_ map: MKMapView)
    
}

final class ContactsVM: ContactsProtocol {
   
    //MARK: Services var
    private var sentEmailService = SentMailServices()
    
    //MARK: Model for stored information about user
    var user: ModelUser?
    
    //MARK: func for sent email
    func sentMessage() {
        sentEmailService.sentMessage(self.user ?? ModelUser())
    }
    
    //MARK: func for work with mapService
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

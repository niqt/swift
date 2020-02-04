//
//  MapView.swift
//  ListAndDetail
//
//  Created by Nicola De FIlippo on 03/02/2020.
//  Copyright © 2020 Nicola De FIlippo. All rights reserved.
//

import SwiftUI


import SwiftUI
import MapKit

final class LandmarkAnnotation: NSObject, MKAnnotation {
    let id: String
    let title: String?
    let coordinate: CLLocationCoordinate2D

    init(landmark: Place) {
        self.id = landmark.id.uuidString
        self.title = landmark.name
        self.coordinate = landmark.location
    }
}

struct MapView: UIViewRepresentable {
    @Binding var landmarks: [Place]
    @Binding var selectedLandmark: Place?
    
    
    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView()
        map.delegate = context.coordinator
        return map
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        updateAnnotations(from: uiView)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    final class Coordinator: NSObject, MKMapViewDelegate {
        var control: MapView

        init(_ control: MapView) {
            self.control = control
        }
        
        func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
            guard let coordinates = view.annotation?.coordinate else { return }
            let span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5) //mapView.region.span
            let region = MKCoordinateRegion(center: coordinates, span: span)
            mapView.setRegion(region, animated: true)
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            guard let annotation = annotation as? LandmarkAnnotation else { return nil }
            let identifier = "Annotation"
            var annotationView: MKMarkerAnnotationView? = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView
            if annotationView == nil {
                annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView?.canShowCallout = true
                annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            } else {
                annotationView?.annotation = annotation
            }
            return annotationView
        }
    }
    
    private func updateAnnotations(from mapView: MKMapView) {
        mapView.removeAnnotations(mapView.annotations)
        let newAnnotations = landmarks.map { LandmarkAnnotation(landmark: $0) }
        mapView.addAnnotations(newAnnotations)
        if let selectedAnnotation = newAnnotations.filter({ $0.id == selectedLandmark?.id.uuidString }).first {
            mapView.selectAnnotation(selectedAnnotation, animated: true)
        }
    }
}

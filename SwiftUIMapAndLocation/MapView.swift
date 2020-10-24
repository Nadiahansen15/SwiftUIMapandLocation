//
//  MapView.swift
//  SwiftUIMapAndLocation
//
//  Created by Nadia Hansen on 02/10/2020.
//  Copyright © 2020 Nadia Hansen. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    @Binding var centerCoordinate:CLLocationCoordinate2D
    
    var annotations: [MKPointAnnotation]
    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView()
        
       map.delegate = context.coordinator
    return map
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        if annotations.count != uiView.annotations.count {
            uiView.removeAnnotations(uiView.annotations)
            uiView.addAnnotations(annotations)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    class Coordinator:NSObject, MKMapViewDelegate {
        var parent:MapView
        init(_ parent:MapView){
            self.parent = parent
        }
        
        
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            parent.centerCoordinate = mapView.centerCoordinate
            // gem ny lok for centrum af map
        }
    }
}



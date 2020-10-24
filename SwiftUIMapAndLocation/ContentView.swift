//
//  ContentView.swift
//  SwiftUIMapAndLocation
//
//  Created by Nadia Hansen on 02/10/2020.
//  Copyright © 2020 Nadia Hansen. All rights reserved.
//
import SwiftUI
import MapKit

struct ContentView: View {
    @State var centerCoordinate = CLLocationCoordinate2D()
    @State var annotations = [MKPointAnnotation]() //liste af gemte locationer
    var body: some View {
        //  1: Få vist MapView
        //  2: Få knappen at stå nederst på siden
        //  3: Få knappen at stå nederst til højre
        ZStack{
            MapView(centerCoordinate: $centerCoordinate, annotations: annotations)
                Circle()
                    .fill()
                    .frame(width: 32, height: 32)
                    .opacity(0.4)
            VStack {
                Spacer()
                HStack {
                    Spacer()
            Button (action: {
                print("you pressed !")
                let newLocation = MKPointAnnotation()
                newLocation.coordinate = self.centerCoordinate
                self.annotations.append(newLocation)
            }, label: {
                Image(systemName:"plus.circle")
            })
                .padding()
                .foregroundColor(.blue)
                .font(.title)
        }
            }
        }
    }
}



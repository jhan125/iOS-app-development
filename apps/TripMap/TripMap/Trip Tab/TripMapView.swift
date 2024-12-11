//
//  TripMapView.swift
//  TripMap
//
//  Created by Jiali Han on 11/22/24.
//


import SwiftUI
import MapKit
import SwiftData

struct TripMapView: View {
    let manager = CLLocationManager()
    @State private var cameraPosition: MapCameraPosition = .userLocation(fallback: .automatic)
    @Query private var listPlacemarks: [MTPlacemark]
    
    var body: some View {
        Map(position: $cameraPosition) {
            UserAnnotation{
                Image(systemName: "star")
                    .imageScale(.large)
                    .foregroundStyle(.blue)
            }
            
            ForEach(listPlacemarks) {placemark in
                Marker(coordinate: placemark.coordinate) {
                    Label(placemark.name, systemImage: "star")
                }
                .tint(.yellow)
            }
        }
        .mapControls{
            MapUserLocationButton()
        }
        .onAppear {
            manager.requestAlwaysAuthorization()
        }
    }
//    @Environment(LocationManager.self) var locationManager
//    @State private var cameraPosition: MapCameraPosition = .userLocation(fallback: .automatic)
//    @Query private var listPlacemarks: [MTPlacemark]
//    var body: some View {
//        Map(position: $cameraPosition) {
//            UserAnnotation()
//            ForEach(listPlacemarks) { placemark in
//                Marker(coordinate: placemark.coordinate) {
//                    Label(placemark.name, systemImage: "star")
//                }
//                .tint(.yellow)
//            }
//        }
//        .onAppear {
//            updateCameraPosition()
//        }
//        .mapControls{
//            MapUserLocationButton()
//        }
//    }
//    
//    func updateCameraPosition() {
//        if let userLocation = locationManager.userLocation {
//            let userRegion = MKCoordinateRegion(
//                center: userLocation.coordinate,
//                span: MKCoordinateSpan(
//                    latitudeDelta: 0.15,
//                    longitudeDelta: 0.15
//                )
//            )
//            withAnimation {
//                cameraPosition = .region(userRegion)
//            }
//        }
//    }
}

#Preview {
    TripMapView()
        .environment(LocationManager())
}

//
//  TripMap.swift
//  TripMap
//
//  Created by Jiali Han on 11/22/24.
//

import SwiftUI
import SwiftData

@main
struct MyTripsApp: App {
    @State private var locationManager = LocationManager()
    var body: some Scene {
        WindowGroup {
            if locationManager.isAuthorized {
                StartTab()
            } else {
                LocationDeniedView()
            }
        }
        .modelContainer(for: Destination.self)
        .environment(locationManager)
    }
}

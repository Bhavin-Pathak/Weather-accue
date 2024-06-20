//
//  LocationManager.swift
//  Weather-accue
//
//  Created by Bhavin Pathak on 19/06/2024
//

import Foundation
import CoreLocation


class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    
    let manager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading: Bool = false
    
    override init() {
        super.init()
        manager.delegate = self
    }
    //MARK: For Request Current Location
    func requestLocation() {
        isLoading = true
        manager.requestLocation()
    }
    //MARK: Get Current Cordinates
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations : [CLLocation]) {
        location = locations.first?.coordinate
        isLoading = false
    }
    //MARK: Error While Fetching Location
    func locationManager(_ manager: CLLocationManager, didFailWithError error : Error) {
        debugPrint("Error Getting Location With Error of :- \(error)")
        isLoading = false
    }
    
}

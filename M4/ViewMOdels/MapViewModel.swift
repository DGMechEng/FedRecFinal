//
//  MapViewModel.swift
//  FedRecApp_M4
//
//  Created by Daniel Gunter on 2023-04-04.
//

import Foundation
import MapKit
import SwiftUI


final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40, longitude: 120),span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))
    @Published var locationArray = [CLLocationCoordinate2D?](repeating: nil, count: 2)
    var facilityCoord = CLLocationCoordinate2D(latitude: 40, longitude: -120)
    
    let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        //self.facilityCoord = coord
        locationManager.delegate = self
     //   locationArray[0] = (getLocationCoord())
      //  locationArray[1] = facilityCoord
      //  self.calcSpan()
    }
    
//    convenience override init() {
//        self.init()
//        self.facilityCoord = CLLocationCoordinate2D(latitude: 0, longitude: 0)
//        locationManager.delegate = self
//        self.locations.append(getLocationCoord())
//        self.locations.append(facilityCoord!)
//        self.calcSpan()
//    }
    
    func requestAllowOnceLocationPermission() {
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let latestLocation = locations.first else {
            return
        }
        
        DispatchQueue.main.async {
            self.region = MKCoordinateRegion(center: latestLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
            self.locationArray[0] = (self.getLocationCoord())
            self.locationArray[1] = self.facilityCoord
            self.calcSpan()
        }
    }
    
    func getLocationCoord() -> CLLocationCoordinate2D {
        return self.region.center
    }
    
//    func getFacilityCoord(facilityCoord: CLLocationCoordinate2D) {
//        locationArray[1] = facilityCoord
//    }
    
    func calcSpan() {
        var minLat = 90.0
        var maxLat = -90.0
        var minLong = 180.0
        var maxLong = -180.0
        for coord in self.locationArray {
            if coord!.latitude < minLat {
                minLat = coord!.latitude
            }
            if coord!.latitude > maxLat {
                maxLat = coord!.latitude
            }
            if coord!.longitude < minLong {
                minLong = coord!.longitude
            }
            if coord!.longitude > maxLong {
                maxLong = coord!.longitude
            }
        }
        self.region.span = MKCoordinateSpan(latitudeDelta: maxLat-minLat, longitudeDelta: maxLong-minLong)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}

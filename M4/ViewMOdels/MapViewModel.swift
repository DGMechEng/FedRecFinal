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
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40, longitude: -100),span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))
    @Published var locationArray = [CLLocationCoordinate2D(latitude: 0, longitude: 0),CLLocationCoordinate2D(latitude: 0, longitude: 0)]
    @Published var mapLocations = [MapLocation(name: "Your Location", coordinate: CLLocationCoordinate2D(latitude: 0, longitude: 0)),MapLocation(name: "Facility Location", coordinate: CLLocationCoordinate2D(latitude: 0, longitude: 0))]
    
    var facilityName = ""
    var facilityCoord = CLLocationCoordinate2D(latitude: 40, longitude: -120)
    
    let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    func fetchData(coord: CLLocationCoordinate2D, name: String) {
        self.facilityCoord = coord
        self.facilityName = name
        requestAllowOnceLocationPermission()
    }
    
    func requestAllowOnceLocationPermission() {
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let latestLocation = locations.first else {
            return
        }
        
        DispatchQueue.main.async {
            self.region = MKCoordinateRegion(center: latestLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
            self.locationArray[0] = (self.getLocationCoord())  //user location
            self.locationArray[1] = self.facilityCoord //facility location
            self.mapLocations[0] = MapLocation(name: "Your Location", coordinate: self.locationArray[0])
            self.mapLocations[1] = MapLocation(name: self.facilityName, coordinate: self.locationArray[1])
            self.calcSpan()
        }
    }
    
    func getLocationCoord() -> CLLocationCoordinate2D {
        return self.region.center
    }
    
//    func setFacilityCoord(coord: CLLocationCoordinate2D) {
//        facilityCoord = coord
//        self.locationArray[1] = self.facilityCoord
//    }
    func getFacilityCoord(facilityCoord: CLLocationCoordinate2D) {
        locationArray[1] = facilityCoord
    }
    
    func calcSpan() {
        //this function loops through the array of locations and finds the min/max lat/long values in order
        //to define the MKCoordinateSpan region to show all locations
        var minLat = 90.0
        var maxLat = -90.0
        var minLong = 180.0
        var maxLong = -180.0
        var avgLat = 0.0
        var avgLong = 0.0
        for coord in self.locationArray {
            if coord.latitude < minLat {
                minLat = coord.latitude
            }
            if coord.latitude > maxLat {
                maxLat = coord.latitude
            }
            if coord.longitude < minLong {
                minLong = coord.longitude
            }
            if coord.longitude > maxLong {
                maxLong = coord.longitude
            }
        }
        avgLat = (maxLat - minLat)/2 + minLat
        avgLong = (maxLong - minLong)/2 + minLong
        self.region.span = MKCoordinateSpan(latitudeDelta: maxLat-minLat+0.5, longitudeDelta: maxLong-minLong+0.5)
        self.region.center=CLLocationCoordinate2D(latitude: avgLat, longitude: avgLong)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}

struct MapLocation: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

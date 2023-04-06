//
//  MapView.swift
//  Assignment3
//
//  Created by Daniel Gunter on 2023-03-20.
//

import MapKit
import SwiftUI
import CoreLocationUI

struct MapView : View {
    
   // var facilityCoord: CLLocationCoordinate2D
    
//    init(facility: CLLocationCoordinate2D) {
//        facilityCoord = facility
//        _mapViewModel = StateObject(wrappedValue: MapViewModel(facCoord: facilityCoord))
//    }
    
    @StateObject var mapViewModel = MapViewModel()
    
//    func setCoord () {
//        mapViewModel.setFacilityCoord(coord: facilityCoord)
//    }
    
    var body: some View {
        return ZStack(alignment: .bottom) {
            Map(coordinateRegion: $mapViewModel.region, showsUserLocation: true)
                .ignoresSafeArea()
                .tint(.pink)
            
            LocationButton(.currentLocation) {
                mapViewModel.requestAllowOnceLocationPermission()
            }
            .foregroundColor(.white)
            .cornerRadius(8)
            .labelStyle(.titleAndIcon)
            .symbolVariant(.slash)
            .padding(.bottom,50)
        }.frame(minHeight: 450)
    }

}

//struct MapView_Previews: PreviewProvider {
//    static var previews: some View {
//        MapView()
//    }
//}

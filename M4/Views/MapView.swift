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
    
   var facilityCoord: CLLocationCoordinate2D
    var facilityName: String
    
    @StateObject var mapViewModel: MapViewModel// = MapViewModel(coord: facilityCoord, name: facilityName)
    
    init(coord: CLLocationCoordinate2D, name: String) {
        self._mapViewModel = StateObject(wrappedValue:MapViewModel(coord: coord, name: name))
        facilityCoord = coord
        facilityName = name
    }
    
    var body: some View {
       // mapViewModel = MapViewModel(coord: facilityCoord, name: facilityName)
        
        return ZStack(alignment: .bottom) {
            Map(coordinateRegion: $mapViewModel.region, annotationItems: mapViewModel.mapLocations, annotationContent: {
                location in MapAnnotation(coordinate: location.coordinate, anchorPoint: CGPoint(x: 0.5, y: 0.5), content: {
                    Image(systemName: "pin.circle.fill").foregroundColor(.blue)
                    Text(location.name)
                })
            })
                .ignoresSafeArea()
                .tint(.pink)
            
            LocationButton(.currentLocation) {
                mapViewModel.fetchData(coord: facilityCoord, name: facilityName)
                //mapViewModel.requestAllowOnceLocationPermission()
            }
            .foregroundColor(.white)
            .cornerRadius(8)
            .labelStyle(.iconOnly)
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



//
//  MapView.swift
//  Assignment3
//
//  Created by Daniel Gunter on 2023-03-20.
//

import MapKit

import SwiftUI

struct MapView: View {
    
    var coordinate : CLLocationCoordinate2D
    
    var body: some View {
        Map(coordinateRegion: .constant(MKCoordinateRegion(center: coordinate, latitudinalMeters: 750, longitudinalMeters: 750)))
    }
}

//struct MapView_Previews: PreviewProvider {
//    static var previews: some View {
//        MapView()
//    }
//}

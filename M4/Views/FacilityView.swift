//
//  FacilityView.swift
//  Assignment3
//
//  Created by Daniel Gunter on 2023-03-20.
//

import SwiftUI
import MapKit
import WebKit

struct FacilityView: View {
    
    var facility: FacilityModel
    let webView = WKWebView()
    
    var body: some View {
        ScrollView {
       
            VStack(alignment: .leading, spacing: 10) {
                    Text(facility.FacilityName)
                        .font(.system(size: 25, design: .rounded))
                        .padding(.horizontal)
                   DescriptionHTMLView (text: facility.FacilityDescription, height: 150)
                    .padding(.horizontal)
                    LinkView(links: facility.LINK)
                    .padding(.horizontal)
                    //Some facilities don't have coordinates, need to handle this
                    if (facility.FacilityLongitude==0.0 || facility.FacilityLatitude == 0.0) {
                        Text("Map coordinates not available")
                            .padding(.horizontal)
                    } else {
                        MapView(coordinate: CLLocationCoordinate2D(latitude: facility.FacilityLatitude, longitude: facility.FacilityLongitude))
                            .frame(height: 300)
                         
                    }
                    Text("Activities at this facility:")
                        .padding(.horizontal)
                    ActivityView(activities: facility.ACTIVITY)
                    .padding(.horizontal)
                    }
            
       }
    }
}



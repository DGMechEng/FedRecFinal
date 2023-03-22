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
       
                VStack(alignment: .leading) {
                    Text(facility.FacilityName)
                        .font(.system(size: 25, design: .rounded))
                    

                    DescriptionHTMLView (text: facility.FacilityDescription, height: 150)
                        
                    LinkView(links: facility.LINK)
                        
                    //Some facilities don't have coordinates, need to handle this
                    if (facility.FacilityLongitude==0.0 || facility.FacilityLatitude == 0.0) {
                        Text("Map coordinates not available")
                    } else {
                        MapView(coordinate: CLLocationCoordinate2D(latitude: facility.FacilityLatitude, longitude: facility.FacilityLongitude))
                            .frame(height: 300)
                    }
                    
                    Text("Activities at this facility:")
                  
                    ActivityView(activities: facility.ACTIVITY)
                        //            Text("Activity 1")
                        //            Text("Activity 2")
                        //            Text("Activity 3")
                    }
            
       }
    }
}


//struct FacilityView_Previews: PreviewProvider {
//    static var previews: some View {
//        FacilityView()
//    }
//}

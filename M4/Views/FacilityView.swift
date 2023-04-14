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
    @ObservedObject var icon = favIcon()
    let webView = WKWebView()
    let favorites = FavoritesViewModel()
    
    var body: some View {
        ScrollView {
       
            VStack(alignment: .leading, spacing: 10) {
                HStack {Text(facility.FacilityName!)
                        .font(.system(size: 25, design: .rounded))
                        .padding(.horizontal)
                    Button(action: {
                        if (favorites.readFacilities.contains(facility.FacilityID!)) {
                            favorites.removeFacility(fac: facility.FacilityID!)
                        } else {
                            favorites.addFacility(fac: facility.FacilityID!)
                        }
                        icon.setIcon(facID: facility.FacilityID!, favorites: favorites.readFacilities)
                        }) {
                        HStack {
                            Text("Favorite")
                            Image(systemName: icon.iconString)
//                            if favorites.readFacilities.contains(facility.FacilityID!) {
//                                Image(systemName: "heart.fill")
//                            } else {
//                                Image(systemName: "heart")
//                            }
                        }
                    }
                    //Text(facility.FacilityID)
                }
                   DescriptionHTMLView (text: facility.FacilityDescription!, height: 150)
                    .padding(.horizontal)
                    LinkView(links: facility.LINK!)
                    .padding(.horizontal)
                    //Some facilities don't have coordinates, need to handle this
                    if (facility.FacilityLongitude!==0.0 || facility.FacilityLatitude! == 0.0) {
                        Text("Map coordinates not available")
                            .padding(.horizontal)
                    } else {
                        MapView(facilityCoord: CLLocationCoordinate2D(latitude: facility.FacilityLatitude!, longitude: facility.FacilityLongitude!), facilityName: facility.FacilityName!)
//                           // .frame(height: 300)
                      //  MapView()
                    }
                    Text("Activities at this facility:")
                        .padding(.horizontal)
                    ActivityView(activities: facility.ACTIVITY!)
                    .padding(.horizontal)
                    }
            
       }
    }
}

class favIcon: ObservableObject {
    
    @Published private(set) var iconString = "heart"

    func setIcon(facID: String, favorites: [String]) {
        if favorites.contains(facID) {
            iconString = "heart.fill"
        } else {
            iconString = "heart"
        }
    }
}

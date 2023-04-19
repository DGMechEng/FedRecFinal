//
//  ShowFacilityView.swift
//  FedRecApp_M4
//
//  Created by Daniel Gunter on 2023-04-17.
//

import SwiftUI
import MapKit
import WebKit

struct ShowFacilityView: View {
    
//    @ObservedObject var icon = favIcon()
    let webView = WKWebView()
    @EnvironmentObject var favoritesvm: FavoritesViewModel
    let facility : FacilityModel
 
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                HStack {Text(facility.FacilityName)
                        .font(.system(size: 25, design: .rounded))
                        .padding(.horizontal)
                    Button(action: {
                        if (favoritesvm.readFacilities.contains(facility.FacilityID)) {
                            favoritesvm.removeFacility(fac: facility.FacilityID, name: facility.FacilityName)
                        } else {
                            favoritesvm.addFacility(fac: facility.FacilityID, name: facility.FacilityName)
                        }
                        
//                        icon.setIcon(facID: facility.FacilityID, favorites: favoritesvm.readFacilities)
                        
                    }) {
                        HStack {
                            Text("Favorite")
                            FavoriteIconView(facility: facility)
                               // .environmentObject(favoritesvm)
                        }
                    }
                }
                DescriptionHTMLView (text: facility.FacilityDescription, height: 150)
                    .padding(.horizontal)
                LinkView(links: facility.LINK)
                    .padding(.horizontal)
                //Some facilities don't have coordinates, need to handle this
                if (facility.FacilityLongitude==0.0 || facility.FacilityLatitude == 0.0) {
                    Spacer()
                    Text("Map coordinates not available")
                        .padding(.horizontal)
                    Spacer()
                } else {
                    MapView(coord: CLLocationCoordinate2D(latitude: facility.FacilityLatitude, longitude: facility.FacilityLongitude), name: facility.FacilityName)
                }
                Text("Activities at this facility:")
                    .padding(.horizontal)
                ActivityView(activities: facility.ACTIVITY)
                    .padding(.horizontal)
            }
        }
    }
}


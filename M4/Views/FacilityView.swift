//
//  FacilityView.swift
//  Assignment3
//
//  Created by Daniel Gunter on 2023-03-20.
//

import SwiftUI

struct FacilityView: View {
    var facility = FacilityModel(FacilityID: "", FacilityName: "", FacilityDescription: "", FacilityLatitude: 0.0, FacilityLongitude: 0.0, ACTIVITY: [], LINK: [])
    var facility_id: String = "-1"
    @ObservedObject var facilityvm = FacilityViewModel()
  //  @EnvironmentObject var favoritesvm: FavoritesViewModel

    var body: some View {
        ScrollView {
            if facility_id != "-1" {  //showing a favorite
                ShowFacilityView(facility: facilityvm.favoriteData)
           }
            else {
                ShowFacilityView(facility: facility)
            }
        }
        .task {
           // let fac = facility_id.components(separatedBy: "_")
            await facilityvm.fetchData(facID: facility_id.components(separatedBy: "_")[0])
        }
    }
}


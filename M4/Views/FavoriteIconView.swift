//
//  FavoriteIconView.swift
//  FedRecApp_M4
//
//  Created by Daniel Gunter on 2023-04-17.
//

import SwiftUI


struct FavoriteIconView: View {
//    @ObservedObject var favorites = FavoritesViewModel()
    @EnvironmentObject var favoritesvm: FavoritesViewModel
//    @ObservedObject var icon = favIcon()

    let facility: FacilityModel
  //  let icon = favIcon()
    
    var body: some View {
        HStack {
            if favoritesvm.readFacilities.contains("\(facility.FacilityID)_\(facility.FacilityName)") {
                Image(systemName: "heart.fill")
            } else {
                Image(systemName: "heart")
            }
        }
        .task {
            await favoritesvm.fetchData()
        }
    }
}


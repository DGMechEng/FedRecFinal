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
            if favoritesvm.readFacilities.contains(facility.FacilityID) {
                Image(systemName: "heart.fill")
            } else {
                Image(systemName: "heart")
            }
            
            //this doesn't work because the icon is displayed before the setIcon function runs
//                .onAppear {
//                    icon.setIcon(facID: facility.FacilityID, favorites: favoritesvm.readFacilities)
//                }
        }.task {
            await favoritesvm.fetchData()
        }
    }
}

//struct FavoriteIconView_Previews: PreviewProvider {
//    static var previews: some View {
//        FavoriteIconView()
//    }
//}

//class favIcon: ObservableObject {
//
//    @Published private(set) var iconString = "heart"
//
//    func setIcon(facID: String, favorites: [String]) {
//        if favorites.contains(facID) {
//            iconString = "heart.fill"
//        } else {
//            iconString = "heart"
//        }
//    }
//}

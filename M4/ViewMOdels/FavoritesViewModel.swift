//
//  FavoritesViewModel.swift
//  FedRecApp_M4
//
//  Created by Daniel Gunter on 2023-04-08.
//

import Foundation

class FavoritesViewModel: ObservableObject, Identifiable {
    @Published private(set) var facilityData: [FacilityModel] = []
    private var favorite = FavoriteViewModel()
    private var facilityID: Set = ["256826","10081910"]
    
    func fetchData() {
        for facility in facilityID {
            favorite.fetchData(facID: facility)
            self.facilityData.append(favorite.favoriteData)
        }
    }
}

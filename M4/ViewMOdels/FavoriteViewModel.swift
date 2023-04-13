//
//  FavoritesViewModel.swift
//  FedRecApp_M4
//
//  Created by Daniel Gunter on 2023-04-03.
//

import Foundation

class FavoriteViewModel: ObservableObject, Identifiable {
    
    @Published private(set) var favoriteData = FacilityModel(FacilityID: "12345", FacilityName: "Canon Infierno #461", FacilityDescription: "Description", FacilityLatitude: 40, FacilityLongitude: -105, ACTIVITY: [ActivityModel(ActivityName: "Biking", FacilityActivityDescription: "You can bike here")], LINK: [LinkModel(URL: "www.google.com", Title: "Google")])
    
    private var url: String = ""
    
    func fetchData(facID: String) async {
        url = "https://ridb.recreation.gov/api/v1/facilities/\(facID)?apikey=570908ba-8eed-43ed-93bd-c7778f1e7a06&full=true"
       
            if let url = URL(string: self.url) {
                do {
                    let (data, _) = try await URLSession.shared.data(from: url)
                    let results = try JSONDecoder().decode(FacilityModel.self, from: data)
                    self.favoriteData = results.self
                } catch {
                    print(error)
                }
            }
    }


}

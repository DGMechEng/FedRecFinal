//
//  FavoritesViewModel.swift
//  FedRecApp_M4
//
//  Created by Daniel Gunter on 2023-04-03.
//

import Foundation

class FavoriteViewModel: ObservableObject, Identifiable {
    
    @Published private(set) var favoriteData = FacilityModel(from: <#Decoder#>)//FacilityModel(FacilityID: "12345", FacilityName: "Canon Infierno #461", FacilityDescription: "Description", FacilityLatitude: 40, FacilityLongitude: -105, ACTIVITY: [ActivityModel(ActivityName: "Biking", FacilityActivityDescription: "You can bike here")], LINK: [LinkModel(URL: "www.google.com", Title: "Google")])
    
    private var url: String = ""
    
    func fetchData(facID: String)  {
        url = "https://ridb.recreation.gov/api/v1/facilities/\(facID)?apikey=570908ba-8eed-43ed-93bd-c7778f1e7a06&full=true"
       
        if let url = URL(string: url)  {
            URLSession
                .shared
                .dataTask(with: url) {(data, response, error) in
                    if let error = error {
                        print(error)
                    } else {
                        if let data = data {
                            do {
                                let results = try JSONDecoder().decode(FacilityModel.self, from: data)
                                self.favoriteData = results.self

                            } catch {
                                print(error)
                            }
                        }
                    }
                }.resume()
        }
    }

}

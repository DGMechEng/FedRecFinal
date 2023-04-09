//
//  FavoritesViewModel.swift
//  FedRecApp_M4
//
//  Created by Daniel Gunter on 2023-04-03.
//

import Foundation

class FavoriteViewModel: ObservableObject, Identifiable {
    
    @Published private(set) var favoriteData = FacilityModel(FacilityID: "12345", FacilityName: "Canon Infierno #461", FacilityDescription: "Description", FacilityLatitude: 40, FacilityLongitude: -105, ACTIVITY: [ActivityModel(ActivityName: "Biking", FacilityActivityDescription: "You can bike here")], LINK: [LinkModel(URL: "www.google.com", Title: "Google")])

//    @Published private(set) var favoriteData = FacilityModel()
    
    private var url: String = ""
    
    func fetchData(facID: String) {
        url = "https://ridb.recreation.gov/api/v1/facilities/\(facID)?apikey=570908ba-8eed-43ed-93bd-c7778f1e7a06&full=true"
        
        if let url = URL(string: self.url) {
            URLSession
                .shared
            //For some reason, on the first time through, the dataTask body is never called
                .dataTask(with: url) { (data, response, error) in
                    if let error = error {
                        print (error)
                    } else {
                        if let data = data {
                            do {
                                //print("made it to data")
                                let results = try JSONDecoder().decode(FacilityModel.self, from: data)
                                DispatchQueue.main.async {
                                    self.favoriteData = results
                                }
                                //maybe this is where I should determine which locations are closest?
                            } catch {
                                print(error)
                            }
                        }
                    }
                }.resume()
        }
    }
    
//    func fetchData(facID: String) {
//        url = "https://ridb.recreation.gov/api/v1/facilities/\(facID)?apikey=570908ba-8eed-43ed-93bd-c7778f1e7a06"
//
//
//    }
}

//
//var id: UUID {
//    return UUID()
//}
////  let id = UUID()
//let FacilityID: String
//let FacilityName: String
//let FacilityDescription: String
//let FacilityLatitude: Double
//let FacilityLongitude: Double
//let ACTIVITY: [ActivityModel]
//let LINK: [LinkModel]

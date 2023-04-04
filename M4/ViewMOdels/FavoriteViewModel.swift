//
//  FavoritesViewModel.swift
//  FedRecApp_M4
//
//  Created by Daniel Gunter on 2023-04-03.
//

import Foundation

class FavoriteViewModel: ObservableObject, Identifiable {
    
    @Published private(set) var facilityData = [FacilityModel]()

    private var url: String = ""
    
    func fetchData(facID: String) {
        url = "https://ridb.recreation.gov/api/v1/facilities/\(facID)?apikey=570908ba-8eed-43ed-93bd-c7778f1e7a06"
        
        if let url = URL(string: self.url) {
            URLSession
                .shared
                .dataTask(with: url) { (data, response, error) in
                    if let error = error {
                        print (error)
                    } else {
                        if let data = data {
                            do {
                                //print("made it to data")
                                let results = try JSONDecoder().decode(FacilityResults.self, from: data)
                                DispatchQueue.main.async {
                                    self.facilityData = results.RECDATA
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

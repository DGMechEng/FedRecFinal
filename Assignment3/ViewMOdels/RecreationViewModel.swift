//
//  RecreationViewModel.swift
//  Assignment3
//
//  Created by Daniel Gunter on 2023-03-20.
//

import Foundation

class RecreationViewModel : ObservableObject {
    
    @Published private(set) var facilityData = [FacilityModel]()
    
    private let url = "https://ridb.recreation.gov/api/v1/organizations/131/facilities?limit=20&offset=0&full=true&state=CO&activity=5&lastupdated=10-01-2018&apikey=570908ba-8eed-43ed-93bd-c7778f1e7a06"
    
    func fetchData() {
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
                            } catch {
                                print(error)
                            }
                        }
                    }
                }.resume()
        }
    }
}

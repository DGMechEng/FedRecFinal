//
//  RecreationViewModel.swift
//  Assignment3
//
//  Created by Daniel Gunter on 2023-03-20.
//

import Foundation
import SwiftUI

class RecreationViewModel : ObservableObject {
    
    @Published private(set) var facilityData = [FacilityModel]()
    //    @Published private(set) var facility = FacilityModel()
    
    private var url: String = ""
//    private var facilityID = ["256826","10081910"]
    
    func fetchData(state: String, org: String, activity: String) {
        url = "https://ridb.recreation.gov/api/v1/organizations/\(org)/facilities?limit=10&offset=0&full=true&state=\(state)&activity=\(activity)&lastupdated=10-01-2018&apikey=570908ba-8eed-43ed-93bd-c7778f1e7a06"
        
        //endpoint for calling individual facility "https://ridb.recreation.gov/api/v1/facilities/\(facID)?apikey=570908ba-8eed-43ed-93bd-c7778f1e7a06"
        
        //would be nice to use this endpoint too (can find facilities within certain distance), but no activity input.  Maybe two separate queries?
        //    https://ridb.recreation.gov/api/v1/facilities?limit=20&offset=0&state=CO&latitude=40.5&longitude=-105&radius=15&activity=6,BOATING&lastupdated=10-01-2018
        
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
}



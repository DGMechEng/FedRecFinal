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
    private var facilityID = ["256826","10081910"]
    
    func fetchData(state: String, org: String) {
        url = "https://ridb.recreation.gov/api/v1/organizations/\(org)/facilities?limit=50&offset=0&state=CO&lastupdated=10-01-2018&apikey=570908ba-8eed-43ed-93bd-c7778f1e7a06"
       // url = "https://ridb.recreation.gov/api/v1/organizations/\(org)/facilities?limit=20&offset=0&full=true&state=\(state)&lastupdated=10-01-2018&apikey=570908ba-8eed-43ed-93bd-c7778f1e7a06"
       // url = "https://ridb.recreation.gov/api/v1/organizations/131/facilities?limit=20&offset=0&full=true&state=\(state)&activity=5&lastupdated=10-01-2018&apikey=570908ba-8eed-43ed-93bd-c7778f1e7a06"
        
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
    
//    func fetchFavorites(userID: String) {
//
//        //need to get all facility IDs associated with userID
//      //  ForEach(0..<facilityID.count) { index in
//
//            url = "https://ridb.recreation.gov/api/v1/facilities/\(facilityID[0])?apikey=570908ba-8eed-43ed-93bd-c7778f1e7a06"
//
//            if let url = URL(string: self.url) {
//                URLSession
//                    .shared
//                    .dataTask(with: url) { (data, response, error) in
//                        if let error = error {
//                            print (error)
//                        } else {
//                            if let data = data {
//                                do {
//                                    let results = try JSONDecoder().decode(FacilityModel.self, from: data)
//                                    DispatchQueue.main.async {
//                                        self.facility.FacilityDescription = results.FacilityDescription
//                                        self.facility.FacilityName = results.FacilityName
//                                        self.facility.FacilityDescription = results.FacilityDescription
//                                        self.facility.FacilityLatitude = results.FacilityLatitude
//                                        self.facility.FacilityLongitude = results.FacilityLongitude
//                                        self.facility.ACTIVITY = results.ACTIVITY
//                                        self.facility.LINK = results.LINK
//                                    }
//                                    //maybe this is where I should determine which locations are closest?
//                                } catch {
//                                    print(error)
//                                }
//                            }
//                        }
//                    }.resume()
//            }
//       // }
//    }
}



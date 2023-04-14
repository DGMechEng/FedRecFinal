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
    
    private var url: String = ""

//        // Would be nice to use this endpoint for finding nearby facilities   https://ridb.recreation.gov/api/v1/facilities?limit=20&offset=0&state=CO&latitude=40.5&longitude=-105&radius=15&activity=6,BOATING&lastupdated=10-01-2018
    
    @MainActor
    func fetchData(state: String, org: String, activity: String) async {
        url = "https://ridb.recreation.gov/api/v1/organizations/\(org)/facilities?limit=200&offset=0&full=true&state=\(state)&activity=\(activity)&lastupdated=10-01-2018&apikey=570908ba-8eed-43ed-93bd-c7778f1e7a06"
        
        if let url = URL(string: self.url) {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let results = try JSONDecoder().decode(FacilityResults.self, from: data)
                self.facilityData = results.RECDATA
            } catch {
                print(error)
            }
        }
    }
}



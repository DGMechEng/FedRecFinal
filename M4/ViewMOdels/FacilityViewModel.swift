//
//  FacilityViewModel.swift
//  FedRecApp_M4
//
//  Created by Daniel Gunter on 2023-04-17.
//

import Foundation

class FacilityViewModel: ObservableObject, Identifiable {
    
    @Published var favoriteData = FacilityModel(FacilityID: "", FacilityName: "", FacilityDescription: "", FacilityLatitude: 0.0, FacilityLongitude: 0.0, ACTIVITY: [], LINK: [])
    @Published public var status: Bool = false
    private var url: String = ""
    
    
    @MainActor
    func fetchData(facID: String) async {
        if facID != "-1" {
            url = "https://ridb.recreation.gov/api/v1/facilities/\(facID)?apikey=570908ba-8eed-43ed-93bd-c7778f1e7a06&full=true"
            
            if let url = URL(string: self.url) {
                do {
                    let (data, _) = try await URLSession.shared.data(from: url)
                    let results = try JSONDecoder().decode(FacilityModel.self, from: data)
                    self.favoriteData = results.self
                    print("er : \(self.favoriteData)")
                    self.status = true
                } catch {
                    print(error)
                }
            }
        }
    }

}

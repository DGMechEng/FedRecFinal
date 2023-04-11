//
//  FacilityModel.swift
//  Assignment3
//
//  Created by Daniel Gunter on 2023-03-20.
//

import Foundation

struct FacilityResults: Codable {
    
  //  let TOTAL_COUNT: String
    let RECDATA: [FacilityModel]
}

struct FacilityModel: Codable, Identifiable {
    var id: UUID {
        return UUID()
    }
  //  let id = UUID()
    let facilityID: String
    let facilityName: String
    let facilityDescription: String
    let facilityLatitude: Double
    let facilityLongitude: Double
    let favoriteIcon: String
    let ACTIVITY: [ActivityModel]
    let LINK: [LinkModel]
}

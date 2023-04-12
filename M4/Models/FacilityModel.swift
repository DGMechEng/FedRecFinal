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

struct FacilityIdentifiable: Codable, Identifiable {
    var id: UUID {
        return UUID()
    }
    let facility: FacilityModel
}
//Now how the f do I incorporate this?

struct FacilityModel: Codable, Identifiable {
    var id: UUID {
        return UUID()
    }
  //  let id = UUID()
    let FacilityID: String
    let FacilityName: String
    let FacilityDescription: String
    let FacilityLatitude: Double
    let FacilityLongitude: Double
    let ACTIVITY: [ActivityModel]
    let LINK: [LinkModel]
}

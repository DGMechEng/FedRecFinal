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

//struct FacilityIdentifiable: Codable, Identifiable {
//    var id: UUID {
//        return UUID()
//    }
//    let facility: FacilityModel
//}
//Now how the f do I incorporate this?

struct FacilityModel: Codable, Identifiable {
    var id: String? {
        FacilityID //computed property since API response doesn't have an item called "id"
    }

    var FacilityID: String?
    var FacilityName: String?
    var FacilityDescription: String?
    var FacilityLatitude: Double?
    var FacilityLongitude: Double?
    var ACTIVITY: [ActivityModel]?
    var LINK: [LinkModel]?
}

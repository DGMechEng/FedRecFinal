//
//  FacilityModel.swift
//  Assignment3
//
//  Created by Daniel Gunter on 2023-03-20.
//

import Foundation

struct FacilityResults: Codable {
    let RECDATA: [FacilityModel]
}

struct FacilityModel: Codable, Identifiable {
    var id: String {
        return FacilityID //computed property since API response doesn't have an item called "id"
    }

    let FacilityID: String
    let FacilityName: String
    let FacilityDescription: String
    let FacilityLatitude: Double
    let FacilityLongitude: Double
    let ACTIVITY: [ActivityModel]
    let LINK: [LinkModel]
}

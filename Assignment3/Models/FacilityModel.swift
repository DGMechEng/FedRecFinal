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
    var id = UUID()
    let FacilityID: String
    let FacilityName: String
    let FacilityDescription: String
    let FacilityLatitude: String
    let FacilityLongitude: String
    let ACTIVITY: [ActivityModel]
    let LINK: LinkModel
}

//
//  ActivityModel.swift
//  Assignment3
//
//  Created by Daniel Gunter on 2023-03-20.
//

import Foundation

struct ActivityModel: Codable, Identifiable {
    var id: UUID {
        return UUID()
    }
    let ActivityName: String
    let FacilityActivityDescription: String
}

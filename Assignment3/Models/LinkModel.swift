//
//  LinkModel.swift
//  Assignment3
//
//  Created by Daniel Gunter on 2023-03-20.
//

import Foundation

struct LinkModel: Codable, Identifiable {
    var id: UUID {
        return UUID()
    }
   // let id = UUID()
    let URL: String
    let Title: String
}

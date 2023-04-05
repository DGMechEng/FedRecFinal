//
//  UserInput.swift
//  Assignment3
//
//  Created by Daniel Gunter on 2023-03-20.
//

import SwiftUI
import UIKit

struct UserInputView: View {
    // let userState=["CO","WY"]
    @ObservedObject var facilityvm = RecreationViewModel()
    
    @State private(set) var userValue="CO"
    @State private(set) var userOrg="131"
    
   // @State private var showDetails = false
    
    var States = ["CO", "WY", "UT", "NM"]
    var Orgs = ["128", "131"]
    //131 is FS, 139 is NPS
    
    //    enum Orgs: String, CaseIterable, Identifiable {
    //        case forest_service
    //        case blm //131 is forest service, 139 is BLM
    //        var id: Self {self}
    //    }
    
    var body: some View {
        NavigationStack {
            List {
                Picker("Select a state: ", selection: $userValue) {
                    ForEach(States, id: \.self) {
                        Text($0)
                    }
                }
                Picker("Select an organization: ", selection: $userOrg) {
                    ForEach(Orgs, id: \.self) {
                        Text($0)
                    }
                }
//                .onChange(of: userValue) { _ in
//                    facilityvm.fetchData(state: userValue)
//                }
                Button(action: {
                    facilityvm.fetchData(state: userValue, org: userOrg)
                  //  facilityvm.fetchFavorites(userID: "")
                }){Text ("Find facilities")}
                Section {
                    ForEach(facilityvm.facilityData) { facility in
                        NavigationLink(destination: {
                            FacilityView(facility: facility)
                        }, label: {
                            Text(facility.FacilityName)
                        })
                    }
                }
            }
            .onAppear {
             //   facilityvm.fetchFavorites(userID: "")
                facilityvm.fetchData(state: userValue, org: userOrg)
            }
            .navigationTitle("Public Lands Facility Finder")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
}


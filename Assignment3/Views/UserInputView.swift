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
    // let orgID = "131" //131 is FS, 139 is BLM
    @ObservedObject var facilityvm = RecreationViewModel()
    
    @State private(set) var userValue="CO"
    
    @State private var showDetails = false
    
    var States = ["CO", "WY", "UT", "NM"]
    
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
                .onChange(of: userValue) { _ in
                    facilityvm.fetchData(state: userValue)
                }
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
                facilityvm.fetchData(state: userValue)
            }
            .navigationTitle("Public Lands Facility Finder")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
}

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
    @State private(set) var userActivity=""
    
   // @State private var showDetails = false
    
    var States = ["CO", "WY", "UT", "NM"]
    var Orgs = [Organization(orgName: "USFS", orgID: "131"),
                Organization(orgName: "NPS",orgID:"128")]
    var Activities = [ActivityOptions(activityName: "Any", activityID: ""),
                      ActivityOptions(activityName: "Biking", activityID: "5"),
                      ActivityOptions(activityName: "Climbing", activityID: "7"),
                      ActivityOptions(activityName: "Historic & Cultural", activityID: "8"),
                      ActivityOptions(activityName: "Camping", activityID: "9"),
                      ActivityOptions(activityName: "Wilderness", activityID: "28"),
                      ActivityOptions(activityName: "Fire lookouts/cabins", activityID: "30"),
                      ActivityOptions(activityName: "Mountain Biking", activityID: "10002"),
                      ActivityOptions(activityName: "Paddling", activityID: "105")]
    //var Orgs = ["128", "131"]
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
                }.onChange(of: userValue) { _ in
                    facilityvm.fetchData(state: userValue, org: userOrg, activity: userActivity)
                }
                
                Picker("Select an organization: ", selection: $userOrg) {
                    ForEach(Orgs, id: \.orgID) {
                        Text($0.orgName)
                    }
                }.onChange(of: userOrg) { _ in
                    facilityvm.fetchData(state: userValue, org: userOrg, activity: userActivity)
                }
                
                Picker("Select an activity: ", selection: $userActivity) {
                    ForEach(Activities, id: \.activityID) {
                        Text($0.activityName)
                    }
                }.onChange(of: userActivity) { _ in
                    facilityvm.fetchData(state: userValue, org: userOrg, activity: userActivity)
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
                facilityvm.fetchData(state: userValue, org: userOrg, activity: userActivity)
            }
            .navigationTitle("Public Lands Facility Finder")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
}

struct UserInputView_Previews: PreviewProvider {
    static var previews: some View {
        UserInputView()
    }
}

struct Organization: Identifiable {
    let id = UUID()
    let orgName: String
    let orgID: String
}

struct ActivityOptions: Identifiable {
    let id = UUID()
    let activityName: String
    let activityID: String
}

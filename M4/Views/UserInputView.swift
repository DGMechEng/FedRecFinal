//
//  UserInput.swift
//  Assignment3
//
//  Created by Daniel Gunter on 2023-03-20.
//

import SwiftUI
import UIKit

struct UserInputView: View {

    @ObservedObject var recreationvm = RecreationViewModel()
    @ObservedObject var favoritesvm = FavoritesViewModel()
    
    @State private(set) var userValue="CO"
    @State private(set) var userOrg="131"
    @State private(set) var userActivity=""
    @State private var showFavorites = false
    
    private var options = UserOptions()

    var body: some View {
        NavigationStack {
            List {
                Section {
                    Picker("Select a state: ", selection: $userValue) {
                        ForEach(options.States, id: \.self) {
                            Text($0)
                        }
                    }.onChange(of: userValue) { _ in
                        Task {
                            await recreationvm.fetchData(state: userValue, org: userOrg, activity: userActivity)
                        }
                    }
             
                    Picker("Select an organization: ", selection: $userOrg) {
                        ForEach(options.Orgs, id: \.orgID) {
                            Text($0.orgName)
                        }
                    }.onChange(of: userOrg) { _ in
                        Task {
                            await recreationvm.fetchData(state: userValue, org: userOrg, activity: userActivity)
                        }
                    }
                    
                    Picker("Select an activity: ", selection: $userActivity) {
                        ForEach(options.Activities, id: \.activityID) {
                            Text($0.activityName)
                        }
                    }.onChange(of: userActivity) { _ in
                        Task{
                            await recreationvm.fetchData(state: userValue, org: userOrg, activity: userActivity)
                        }
                    }
                }
                
//                Section {
//                    Button("Show favorites") {
//                        showFavorites.toggle()
//                        favoritesvm.fetchData()
//                    }
//                }
                Section {
                    if(!showFavorites) {
                        ForEach(recreationvm.facilityData) { facility in
                            NavigationLink(destination: {
                                FacilityView(facility: facility)
                            }, label: {
                                Text(facility.FacilityName!)
                            })
                        }
                    } else {
                        
                        ForEach(favoritesvm.facilityData) { facility in
                            NavigationLink(destination: {
                                FacilityView(facility: facility)
                            }, label: {
                                Text(facility.FacilityName!)
                            })
                        }
                    }
                }
            }
            .onAppear {
                Task {
                    await recreationvm.fetchData(state: userValue, org: userOrg, activity: userActivity)
                }
            }
            .navigationTitle("Public Lands Facility Finder")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("Favorites") {
                   showFavorites.toggle()
                    favoritesvm.fetchData()
                }
            }
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

struct UserOptions {
    var States = ["AK", "AL", "AR", "AS", "AZ", "CA", "CO", "CT", "DC", "DE", "FL", "GA", "GU", "HI", "IA", "ID", "IL", "IN", "KS", "KY", "LA", "MA", "MD", "ME", "MI", "MN", "MO", "MP", "MS", "MT", "NC", "ND", "NE", "NH", "NJ", "NM", "NV", "NY", "OH", "OK", "OR", "PA", "PR", "RI", "SC", "SD", "TN", "TX", "UM", "UT", "VA", "VI", "VT", "WA", "WI", "WV", "WY"]
    var Orgs = [Organization(orgName: "USFS", orgID: "131"),
                Organization(orgName: "USDA",orgID:"163"),
                Organization(orgName: "NPS",orgID:"128"),
                Organization(orgName: "BLM",orgID:"126"),
                Organization(orgName: "DOI",orgID:"139"),
                Organization(orgName: "NRHP",orgID:"143")]
    var Activities = [ActivityOptions(activityName: "Any", activityID: ""),
                      ActivityOptions(activityName: "Biking", activityID: "5"),
                      ActivityOptions(activityName: "Climbing", activityID: "7"),
                      ActivityOptions(activityName: "Historic & Cultural", activityID: "8"),
                      ActivityOptions(activityName: "Camping", activityID: "9"),
                      ActivityOptions(activityName: "Wilderness", activityID: "28"),
                      ActivityOptions(activityName: "Fire lookouts/cabins", activityID: "30"),
                      ActivityOptions(activityName: "Mountain Biking", activityID: "10002"),
                      ActivityOptions(activityName: "Paddling", activityID: "105")]
}

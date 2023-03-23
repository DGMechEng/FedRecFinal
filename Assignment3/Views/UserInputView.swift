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
    // @ObservedObject var facilityvm = RecreationViewModel()
     
    @State private(set) var userValue=""
    @State private var showDetails = false
    enum States: String, CaseIterable, Identifiable {
        case CO, WY, UT, NM
        var id: Self {self}
    }
    var body: some View {
        VStack {
            NavigationView {
                List {
                    //Text("Public Lands Facility Finder")
                    //                 HStack {
                    //                     Text("Enter State Abbreviation:")
                    //                     TextField("", text: $userValue)
                    //                         .textFieldStyle(.roundedBorder)
                    //                         .keyboardType(.alphabet)
                    //                 }
                    Picker("State", selection: $userValue) {
                        ForEach(States.allCases) {
                            state in Text(state.rawValue)
                        }
                    }
                    Button("Find Facilities") {
                        showDetails.toggle()
                    }
                    
                    
                }
                .navigationTitle("Public Lands Facility Finder")
            }
            if showDetails {
                FacilityNavigatorView(state: userValue)
                // showDetails.toggle()
            }
        }
         
     }
}

//struct UserInput_Previews: PreviewProvider {
//    static var previews: some View {
//        UserInputView()
//    }
//}

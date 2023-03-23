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
     
    @State private(set) var userValue="CO"
  
    @State private var showDetails = false
    
    var States = ["CO", "WY", "UT", "NM"]
    
//    enum Orgs: String, CaseIterable, Identifiable {
//        case forest_service
//        case blm //131 is forest service, 139 is BLM
//        var id: Self {self}
//    }
    
    var body: some View {
        VStack {
            NavigationView {
                List {
                    Picker("Select a state: ", selection: $userValue) {
                        ForEach(States, id: \.self) {
                            Text($0)
                        }
                    }
                   Button("Find Facilities") {
                       showDetails.toggle()
                    }
                }
                .frame(minWidth: 0, minHeight: 0, idealHeight: 100, maxHeight: 150)
                .navigationTitle("Public Lands Facility Finder")
            }
     
            if showDetails {
                //showDetails.toggle()
                FacilityNavigatorView(state: userValue)
            }
                            
        }
         
     }
}

//struct UserInput_Previews: PreviewProvider {
//    static var previews: some View {
//        UserInputView()
//    }
//}

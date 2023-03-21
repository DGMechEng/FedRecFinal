//
//  UserInput.swift
//  Assignment3
//
//  Created by Daniel Gunter on 2023-03-20.
//

import SwiftUI

struct UserInput: View {
    // let userState=["CO","WY"]
    // let orgID = "131" //131 is FS, 139 is BLM
     @ObservedObject var facilityvm = RecreationViewModel()
     
     var body: some View {
         NavigationStack {
             List {
                 
                 ForEach(facilityvm.facilityData) {facility in
                     NavigationLink {
                         FacilityView(facility: facility)
                     } label: {
                         Text(facility.FacilityName)
                     }
               }
             }
         }
 //        VStack {
 //            Text("User Input View")
 //            FacilityNavigator()
 //        }
 //        .padding()
     }
}

struct UserInput_Previews: PreviewProvider {
    static var previews: some View {
        UserInput()
    }
}

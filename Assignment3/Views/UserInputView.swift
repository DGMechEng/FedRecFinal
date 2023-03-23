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
     
    @State private(set) var userValue: String = "CO"
    
     var body: some View {
      
             VStack {
                 Text("Public Lands Facility Finder")
                 HStack {
                     Text("Enter State Abbreviation:")
                     TextField("", text: $userValue)
                         .textFieldStyle(.roundedBorder)
                         .keyboardType(.alphabet)
                 }

                 FacilityNavigatorView(state: userValue)
             }
         
     }
}

struct UserInput_Previews: PreviewProvider {
    static var previews: some View {
        UserInputView()
    }
}

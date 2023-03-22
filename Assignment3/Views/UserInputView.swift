//
//  UserInput.swift
//  Assignment3
//
//  Created by Daniel Gunter on 2023-03-20.
//

import SwiftUI

struct UserInputView: View {
    // let userState=["CO","WY"]
    // let orgID = "131" //131 is FS, 139 is BLM
    // @ObservedObject var facilityvm = RecreationViewModel()
     
    
     var body: some View {
         VStack {
             Text("User Input Page")
             FacilityNavigatorView()
         }

     }
}

struct UserInput_Previews: PreviewProvider {
    static var previews: some View {
        UserInputView()
    }
}

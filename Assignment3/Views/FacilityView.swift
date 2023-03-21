//
//  FacilityView.swift
//  Assignment3
//
//  Created by Daniel Gunter on 2023-03-20.
//

import SwiftUI

struct FacilityView: View {
    
    var facility: FacilityModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(facility.FacilityName)
                .font(.system(size: 25, design: .rounded))
            Text (facility.FacilityDescription)
          //  MapView()
            Text(facility.LINK.URL)
//            Text("Activity 1")
//            Text("Activity 2")
//            Text("Activity 3")
        }
    }
}

//struct FacilityView_Previews: PreviewProvider {
//    static var previews: some View {
//        FacilityView()
//    }
//}

//
//  FacilityView.swift
//  Assignment3
//
//  Created by Daniel Gunter on 2023-03-20.
//

import SwiftUI
import MapKit

struct FacilityView: View {
    
    var facility: FacilityModel
    
    var body: some View {
      //  ScrollView {
           // List {
            VStack(alignment: .leading) {
                Text(facility.FacilityName)
                    .font(.system(size: 25, design: .rounded))
                DescriptionHTMLView (text: facility.FacilityDescription)
                LinkView(links: facility.LINK)
                    
                //Some facilities don't have coordinates, need to handle this
                MapView(coordinate: CLLocationCoordinate2D(latitude: facility.FacilityLatitude, longitude: facility.FacilityLongitude))
                    .frame(height: 300)
                    
                    //            Text("Activity 1")
                    //            Text("Activity 2")
                    //            Text("Activity 3")
                }
            //}
       // }
    }
}

func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
    // open URL in SFSafariViewController for example
    return false
}

//struct FacilityView_Previews: PreviewProvider {
//    static var previews: some View {
//        FacilityView()
//    }
//}

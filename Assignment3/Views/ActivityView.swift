//
//  ActivityView.swift
//  Assignment3
//
//  Created by Daniel Gunter on 2023-03-22.
//

import SwiftUI

struct ActivityView: View {
    
    var activities: [ActivityModel]
    
    var body: some View {
        ForEach(activities) { activity in
            Text(activity.ActivityName)
            DescriptionHTMLView(text: activity.FacilityActivityDescription, height: 30)
        }
        
    }
}

//struct ActivityView_Previews: PreviewProvider {
//    static var previews: some View {
//        ActivityView()
//    }
//}

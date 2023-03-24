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
        VStack {
            ForEach(activities) { activity in
                Text(activity.ActivityName)
                    .font(.system(size: 15))
                    .frame(maxWidth: .infinity, alignment: .leading)
                DescriptionHTMLView(text: activity.FacilityActivityDescription, height: 10)
            }
        }
    }
}


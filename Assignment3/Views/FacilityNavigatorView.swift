//
//  FacilityNavigator.swift
//  Assignment3
//
//  Created by Daniel Gunter on 2023-03-20.
//

import SwiftUI

struct FacilityNavigatorView: View {
    
    let state: String
    
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
            .onAppear{
                facilityvm.fetchData(state: state)
            }
        }
    }
}


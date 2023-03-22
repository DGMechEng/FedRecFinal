//
//  FacilityNavigator.swift
//  Assignment3
//
//  Created by Daniel Gunter on 2023-03-20.
//

import SwiftUI

struct FacilityNavigatorView: View {
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
                facilityvm.fetchData()
            }
        }
    }
}

struct FacilityNavigator_Previews: PreviewProvider {
    static var previews: some View {
        FacilityNavigatorView()
    }
}

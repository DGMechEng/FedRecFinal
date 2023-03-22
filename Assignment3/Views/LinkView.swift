//
//  LinkView.swift
//  Assignment3
//
//  Created by Daniel Gunter on 2023-03-21.
//

import SwiftUI

struct LinkView: View {
    
    var links : [LinkModel]
    
    var body: some View {
        ForEach(links) {link in
            Text(link.URL)
        }
    }
    
}

//struct LinkView_Previews: PreviewProvider {
//    static var previews: some View {
//        LinkView()
//    }
//}

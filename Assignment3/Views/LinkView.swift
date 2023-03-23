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
        HStack {
            Image(systemName: "link")
            ForEach(links) {link in
                Link(link.Title, destination: URL(string: link.URL)!)
                    .font(.system(size: 15))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
    
}

//struct LinkView_Previews: PreviewProvider {
//    static var previews: some View {
//        LinkView()
//    }
//}

//
//  DescriptionHTMLView.swift
//  Assignment3
//
//  Created by Daniel Gunter on 2023-03-21.
//

import SwiftUI
import WebKit

struct DescriptionHTMLView: UIViewRepresentable {
    let text: String
  
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.loadHTMLString(text, baseURL: nil)
    }
    
}

//struct DescriptionHTMLView_Previews: PreviewProvider {
//    static var previews: some View {
//        DescriptionHTMLView()
//    }
//}

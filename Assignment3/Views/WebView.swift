//
//  DescriptionHTMLView.swift
//  Assignment3
//
//  Created by Daniel Gunter on 2023-03-21.
//

import SwiftUI
import WebKit

struct DescriptionHTMLView: View {
    let text: String
    let height: CGFloat
    
    var body: some View {
        WebView(text: text)
            .frame(minWidth: 50, maxWidth: .infinity, minHeight: 0,idealHeight: height, maxHeight: .infinity)
        //    .font(Font: largeTitle)
    }
}

struct WebView: UIViewRepresentable {
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

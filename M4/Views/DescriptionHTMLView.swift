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
        ViewHTMLText(html:text)
        //WebView(text: text)
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
        DispatchQueue.main.async {
            uiView.loadHTMLString(text, baseURL: nil)
        }
        
    }

}

@available(iOS 15, *)
struct ViewHTMLText: View {
    let html: String
    var body: some View {
        
       // let html = "<h1>Heading</h1> <p>paragraph.</p>"

//        if let nsAttributedString = try? NSAttributedString(data: Data(html.utf8), options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil),
//           let attributedString = try? AttributedString(nsAttributedString, including: \.uiKit) {
//            Text(attributedString)
//                .font(.title3)
//        } else {
            // fallback...
            Text(html)
     //   }
    }
}


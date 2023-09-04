//
//  AppleDocumentationView.swift
//  Closure Tutorial
//
//  Created by Jeremy Skrdlant on 9/4/23.
//

import SwiftUI
import WebKit

struct AppleDocumentationView: View {
    var body: some View {
        VStack{
            //This is our custom webview from below.
            DocWebView()
        }
    }
}

struct AppleDocumentationView_Previews: PreviewProvider {
    static var previews: some View {
        AppleDocumentationView()
    }
}

//This struct converts a UIKit storyboard view into a SwiftUI View.
struct DocWebView: UIViewRepresentable {
    let url = URL(string: "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/closures/")

    func makeUIView(context: Context) -> WKWebView {

        return WKWebView()
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {

        guard let url = url else {
            return
        }
        
        let request = URLRequest(url: url)
        webView.load(request)
    }
}

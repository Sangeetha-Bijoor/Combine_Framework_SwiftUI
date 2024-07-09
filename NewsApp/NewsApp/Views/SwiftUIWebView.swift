import SwiftUI
import WebKit

struct SwiftUIWebView: UIViewRepresentable {
    
    let webViewUrl: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        guard let webViewUrl =  URL(string: webViewUrl)
               else {
            return
        }
        let requestUrl = URLRequest(url: webViewUrl)
        uiView.load(requestUrl)
    }
    
}

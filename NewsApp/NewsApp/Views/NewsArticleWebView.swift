//
//  NewsArticleWebView.swift
//  NewsApp
//
//  Created by Sangeetha Bijoor on 09/07/24.
//

import SwiftUI

struct NewsArticleWebView: View {
    
    var newsUrl: String
    
    var body: some View {
        SwiftUIWebView(webViewUrl: newsUrl)
            .padding(.top, 20)
    }
}

#Preview {
    NewsArticleWebView(newsUrl: "")
}

//
//  NewsListTableViewCell.swift
//  NewsApp
//
//  Created by Sangeetha Bijoor on 03/07/24.
//

import SwiftUI

struct NewsListTableViewCell: View {
    
    var newsArticle : NewsArticle
    @State private var isPresented: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(newsArticle.title)
                .fontWeight(.bold)
            HStack {
                Spacer()
                Text(newsArticle.publishedDate)
            }
            AsyncImage(url: URL(string: newsArticle.urlToImage) ) { image in
                image.resizable()
                    .frame(maxWidth: UIScreen.main.bounds.width - 30, maxHeight: 250)
                    .cornerRadius(10)
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                    .shadow(color: .black, radius: 5, x: 5, y: 5)
            } placeholder: {
                ProgressView("Loading...")
                    .frame(maxWidth: 100, maxHeight: 100)
            }
            Spacer()
            Text(newsArticle.description)
            Spacer()
            Text(newsArticle.author)
                .foregroundColor(.white)
                .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
                .font(.subheadline)
                .fontDesign(.rounded)
                .background(.black)
                .cornerRadius(10.0)
            Spacer()
        }.sheet(isPresented: $isPresented) {
            NewsArticleWebView(newsUrl: self.newsArticle.url)
        }
        .onTapGesture {
            isPresented.toggle()
        }
    }
}

#Preview {
    NewsListTableViewCell(newsArticle: NewsArticle(author: "", title: "Title", description: "My description", url: "", urlToImage: "", publishedAt: "", content: ""))
}

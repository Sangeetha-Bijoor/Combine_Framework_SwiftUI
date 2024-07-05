//
//  NewsListTableViewCell.swift
//  NewsApp
//
//  Created by Sangeetha Bijoor on 03/07/24.
//

import SwiftUI

struct NewsListTableViewCell: View {
    
    var newsArticle : NewsArticle
    
    var body: some View {
        HStack(alignment: .top) {
            VStack {
                AsyncImage(url: URL(string: newsArticle.urlToImage) ) { image in
                    image.resizable()
                        .frame(maxWidth: 100, maxHeight: 100)
                } placeholder: {
                    ProgressView("Loading...")
                        .frame(maxWidth: 100, maxHeight: 100)
                }
                
                Text(newsArticle.publishedDate)
            }
            
            VStack {
                Text(newsArticle.title)
                    .fontWeight(.bold)
                Text(newsArticle.description)
            }
        }
    }
}

#Preview {
    NewsListTableViewCell(newsArticle: NewsArticle(author: "", title: "Title", description: "My description", url: "", urlToImage: "https://i.abcnewsfe.com/a/2b50a280-440c-415f-8beb-fe66349d364f/GettyImages-2141954357_1719891847602_hpMain_16x9.jpg?w=1600", publishedAt: "", content: ""))
}

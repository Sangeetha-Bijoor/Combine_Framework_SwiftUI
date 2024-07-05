//
//  NewsArticle.swift
//  NewsApp
//
//  Created by Sangeetha Bijoor on 03/07/24.
//

import Foundation

struct NewsArticleResponse: Decodable {
    let articles: [NewsArticle]
}

struct NewsArticle: Decodable {
    let author: String
    let title: String
    let description: String
    let url: String
    let urlToImage: String
    let publishedAt: String
    let content: String
    var publishedDate: String {
        publishedAt.getFormattedDate()
    }
}

//
//  NewsListScreen.swift
//  NewsApp
//
//  Created by Sangeetha Bijoor on 03/07/24.
//

import SwiftUI

struct NewsListScreen: View {
    
    var newsSource: NewsSource?
    
    @StateObject var newsListViewModel = NewsListViewModel()
    
    var body: some View {
        List(newsListViewModel.newsList, id: \.title) { data in
            NewsListTableViewCell(newsArticle: data)
        }
        .listStyle(.plain)
        .navigationTitle(newsSource?.name ?? "")
        .onAppear() {
            newsListViewModel.fetchNewsArticles(withSourceId: newsSource?.id)
        }
    }
}

#Preview {
    NewsListScreen(newsSource: NewsSource(id: "", name: "Title", description: "description", url: "https://i.abcnewsfe.com/a/2b50a280-440c-415f-8beb-fe66349d364f/GettyImages-2141954357_1719891847602_hpMain_16x9.jpg?w=1600", category: "", language: "", country: ""))
}

//
//  NewsSourceListScreen.swift
//  NewsApp
//
//  Created by Sangeetha Bijoor on 03/07/24.
//

import SwiftUI

struct NewsSourceListScreen: View {
    
    @StateObject var newsSourceViewModel = NewsSourceViewModel()
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                if newsSourceViewModel.isLoading {
                    ProgressView("Loading...")
                        .progressViewStyle(.circular)
                    
                } else {
                    
                    List(newsSourceViewModel.newsSources, id: \.id) { data in
                        NavigationLink(destination: NewsListScreen(newsSource: data)) {
                            NewsSourceListTableViewCell(news: data)
                        }
                    }
                    .listStyle(.plain)
                    .navigationTitle("News Sources")
                    .navigationBarItems(trailing: Button(action: {
                        Task {
                            newsSourceViewModel.fetchNewsSources()
                        }
                    }, label: {
                        Image(systemName: "arrow.clockwise.circle")
                    }))
                }
            }
            
        }
        .onAppear() {
            newsSourceViewModel.fetchNewsSources()
        }
    }
}

#Preview {
    NewsSourceListScreen()
}

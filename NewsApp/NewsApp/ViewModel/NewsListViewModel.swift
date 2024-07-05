//
//  NewsListViewModel.swift
//  NewsApp
//
//  Created by Sangeetha Bijoor on 03/07/24.
//

import Foundation
import Combine

class NewsListViewModel: ObservableObject {
    
    private var cancellable = Set<AnyCancellable>()
    @Published var newsList = [NewsArticle]()
    
    func fetchNewsArticles(withSourceId sourceId: String?) {
        guard let sourceId = sourceId else {
            return
        }
        NetworkManager.shared.getData(endpoint: Constants.Urls.topheadlines(by: sourceId)!, type: NewsArticleResponse.self).sink { completion in
            switch completion {
            case .failure(let error):
                print(error)
            case .finished:
                print("finished")
            }
        } receiveValue: {[weak self] newsArticles in
            self?.newsList = newsArticles.articles
        }.store(in: &cancellable)
    }
}

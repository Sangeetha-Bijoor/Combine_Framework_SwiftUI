//
//  NewsSourceViewModel.swift
//  NewsApp
//
//  Created by Sangeetha Bijoor on 03/07/24.
//

import Foundation
import Combine

class NewsSourceViewModel: ObservableObject {
    
    private var cancellables = Set<AnyCancellable>()
    @Published var newsSources = [NewsSource]()
    @Published var isLoading: Bool = false
    
    func fetchNewsSources() {
        isLoading = true
        NetworkManager.shared.getData(endpoint: Constants.Urls.sources, type: NewsSourceResponse.self) .sink { [weak self] completion in
            switch completion {
            case .failure(let error):
                print("Error = \(error)")
            case .finished:
                self?.isLoading = false
                print("Finished")
            }
        } receiveValue: {[weak self] response in
            self?.newsSources = response.sources
        }
        .store(in: &cancellables)
    }
}

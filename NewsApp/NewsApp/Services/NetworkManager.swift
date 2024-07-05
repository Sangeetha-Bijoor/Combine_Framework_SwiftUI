//
//  NetworkManager.swift
//  NewsApp
//
//  Created by Sangeetha Bijoor on 05/07/24.
//

import Foundation
import Combine

enum NetworkError: Error {
    case badUrl
    case invalidData
    case decodingError
}


class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    private var cancellables = Set<AnyCancellable>()
    
    func getData<T: Decodable>(endpoint: String,
                               type: T.Type) -> Future<T, Error> {
        return Future<T, Error> { [weak self] promise in
            guard let strongSelf = self,
                  let url = URL(string: Constants.Urls.baseUrl + endpoint) else {
                return promise(.failure(NetworkError.badUrl))
            }
            print("URL is \(url.absoluteString)")
            
            URLSession.shared.dataTaskPublisher(for: url)
                .tryMap { (data, response) in
                    guard let httpResponse = response as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode else {
                        throw NetworkError.invalidData
                    }
                    return data
                }
                .decode(type: T.self, decoder: JSONDecoder())
                .receive(on: RunLoop.main)
                .sink { completion in
                    if case let .failure(error) = completion {
                        switch error {
                        case let decodingError as DecodingError:
                            promise(.failure(decodingError))
                        case let apiError as NetworkError:
                            promise(.failure(apiError))
                        default:
                            promise(.failure(NetworkError.invalidData))
                        }
                    }
                } receiveValue: { promise(.success($0 as! T)) }
                .store(in: &strongSelf.cancellables)
        }
    }
    
}

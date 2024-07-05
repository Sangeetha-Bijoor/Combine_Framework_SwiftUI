//
//  Constants.swift
//  NewsApp
//
//  Created by Sangeetha Bijoor on 03/07/24.
//

import Foundation

struct Constants {
    
    struct Urls {
        
        static let baseUrl = "https://api.example.com/v1/"
        
        static func topheadlines(by source: String) -> String? {
            "top-headlines?sources=\(source)&apiKey=0000"
        }
        
        static let sources: String = "sources?apiKey=0000"
    }
}

//
//  NewsSource.swift
//  NewsApp
//
//  Created by Sangeetha Bijoor on 03/07/24.
//

import Foundation


struct NewsSourceResponse: Decodable {
    let sources: [NewsSource]
}
 
struct NewsSource: Decodable {
    let id: String
    let name: String
    let description: String
    let url: String
    let category: String
    let language: String
    let country: String
}

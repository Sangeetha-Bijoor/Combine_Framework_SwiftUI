//
//  NewsListTableViewCell.swift
//  NewsApp
//
//  Created by Sangeetha Bijoor on 03/07/24.
//

import SwiftUI

struct NewsSourceListTableViewCell: View {
    var news: NewsSource?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(news?.name ?? "")
                .bold()
                .font(.title)
            Text(news?.description ?? "")
                .font(.subheadline)
        }.frame(maxWidth: .infinity, alignment: .leading)
        .padding(20)
        .cornerRadius(0.5)
    }
}

#Preview {
    NewsSourceListTableViewCell(news: NewsSource(id: "", name: "News", description: "News description", url: "", category: "", language: "", country: ""))
}

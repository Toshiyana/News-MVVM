//
//  Article.swift
//  News-MVVM
//
//  Created by Toshiyana on 2021/12/11.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String?
}

//
//  Webservice.swift
//  News-MVVM
//
//  Created by Toshiyana on 2021/12/11.
//

import Foundation

struct Webservice {
    
    static func getArticles(url: URL, completion: @escaping ([Article]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                
//                let articles = try? JSONDecoder().decode([Article].self, from: data)
                let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)
                
                if let articleList = articleList {
                    completion(articleList.articles)
                }
//                print(articleList?.articles)
            }
        }.resume()
    }
}

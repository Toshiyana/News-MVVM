//
//  NewsTableViewController.swift
//  News-MVVM
//
//  Created by Toshiyana on 2021/12/11.
//

import UIKit

class NewsTableViewController: UITableViewController {
    
    private var articleListVM: ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(ArticleTableViewCell.nib(), forCellReuseIdentifier: ArticleTableViewCell.identifier)
        updateAppearance()
        populateNews()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return articleListVM == nil ? 0 : articleListVM.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleListVM.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.identifier, for: indexPath) as? ArticleTableViewCell else {
            fatalError("ArticleTableViewCell is not found.")
        }
        
        let articleVM = articleListVM.articleAtIndex(indexPath.row)
        
        cell.configure(title: articleVM.title, description: articleVM.description)
        
        return cell
    }
    
    private func updateAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(displayP3Red: 47/255, green: 54/255, blue: 64/255, alpha: 1.0)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        navigationItem.compactAppearance = appearance
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func populateNews() {
        let url = URL(string: "https://newsapi.org/v2/everything?q=Apple&from=2021-12-06&sortBy=popularity&apiKey=\(APIKey.newsKey)")!
        
        Webservice.getArticles(url: url) { [weak self] articles in
            
            if let articles = articles {
                self?.articleListVM = ArticleListViewModel(articles: articles)
                
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
        }
    }
}

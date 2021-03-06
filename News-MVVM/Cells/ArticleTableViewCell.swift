//
//  ArticleTableViewCell.swift
//  News-MVVM
//
//  Created by Toshiyana on 2021/12/11.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {

    static let identifier = "ArticleTableViewCell"
    
    static func nib() -> UINib {
        UINib(nibName: "ArticleTableViewCell", bundle: nil)
    }
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!

    func configure(title: String, description: String) {
        titleLabel.text = title
        descriptionLabel.text = description
    }
    
}

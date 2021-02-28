//
//  alamofireTableViewCell.swift
//  samplelibrary
//
//  Created by 木元健太郎 on 2021/02/26.
//

import UIKit

final class GithubTableViewCell: UITableViewCell {
  
  
    @IBOutlet weak var titleLabel: UILabel!
    
   
   
    @IBOutlet weak var urlLabel: UILabel!
    

  func configure(githubModel: GithubModel) {
    titleLabel.text = githubModel.name
    urlLabel.text = githubModel.urlStr
  }
}

//
//  AlamofireViewController.swift
//  samplelibrary
//
//  Created by 木元健太郎 on 2021/02/26.
//

import UIKit

final class GithubSearchViewController: UIViewController {

    @IBOutlet private weak var indicator: UIActivityIndicatorView!
      @IBOutlet private weak var urlTextField: UITextField!

      @IBOutlet private weak var tableView: UITableView! {
        didSet {
          let cell = UINib(nibName: "GithubTableViewCell", bundle: nil)
          tableView.register(cell, forCellReuseIdentifier: "Cell")
        }
      }
      @IBOutlet private weak var searchButton: UIButton! {
        didSet {
          searchButton.addTarget(self, action: #selector(tapSearchButton(_:)), for: .touchUpInside)
        }
      }

      var responseData: [GithubModel] = []

      override func viewDidLoad() {
        super.viewDidLoad()
        indicator.isHidden = true
        tableView.isHidden = true
      }

      //APIを叩いてテーブルをリロードするメソッド
      private func reload(searchWord: String) {
        tableView.isHidden = true
        indicator.isHidden = false
        GithubAPI.shared.get(searchWord: searchWord, success: {[weak self] (models) in
          //APIからのデータを保存
          self?.responseData = models
          //テーブルのリロード
          self?.tableView.reloadData()
          self?.tableView.isHidden = false
          self?.indicator.isHidden = true
        }, error: nil)
      }

      @objc func tapSearchButton(_ button: UIButton) {
        guard
          let searchWord = urlTextField.text, searchWord.count > 0
        else { return }
        //リロード
        self.reload(searchWord: searchWord)
      }
    }

    extension GithubSearchViewController: UITableViewDataSource {
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return responseData.count
      }

      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let githubModel = responseData[indexPath.item]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! GithubTableViewCell
        cell.configure(githubModel: githubModel)
        return cell
      }
    }

    extension GithubSearchViewController: UITableViewDelegate {
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
                    return 100
                }
        }
        
        
    



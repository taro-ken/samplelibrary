//
//  GithubModel.swift
//  samplelibrary
//
//  Created by 木元健太郎 on 2021/02/26.
//



import Foundation

struct GithubResponse: Codable {
  let items: [GithubModel]?
}

struct GithubModel: Codable {
  let id: Int
  let name: String
  private let fullName: String
  var urlStr: String { "https://github.com/\(fullName)" }

  enum CodingKeys: String, CodingKey {
    case id
    case name
    case fullName = "full_name"
  }
}

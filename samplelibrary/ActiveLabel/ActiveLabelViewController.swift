//
//  ActiveLabelViewController.swift
//  samplelibrary
//
//  Created by 木元健太郎 on 2021/02/26.
//

import UIKit
import ActiveLabel

final class ActiveLabelViewController: UIViewController {
  private let activeLabel1 = ActiveLabel()
  @IBOutlet private weak var activeLabelContainerView1: UIView! {
    didSet {
      activeLabelContainerView1.addSubview(activeLabel1)
      activeLabel1.snp.makeConstraints { $0.edges.equalToSuperview() }
      activeLabel1.numberOfLines = 0
      activeLabel1.enabledTypes = [.mention]
      activeLabel1.text = "こちらこそありがとうございます！\n @sakiyamaK 楽しみに待っています！"
      activeLabel1.textColor = .black
      activeLabel1.mentionColor = .red
      activeLabel1.handleMentionTap { self.alert("mention", message: $0) }
    }
  }

  private let activeLabel2 = ActiveLabel()
  @IBOutlet private weak var activeLabelContainerView2: UIView! {
    didSet {
      activeLabelContainerView2.addSubview(activeLabel2)
      activeLabel2.snp.makeConstraints { $0.edges.equalToSuperview() }
      activeLabel2.numberOfLines = 0
      activeLabel2.enabledTypes = [.hashtag]
      activeLabel2.text = "プログラミングを始めて２日目！\n終えることができました。\n継続して勉強できるように頑張りたい\n#駆け出しエンジニアと繋がりたい\n"
      activeLabel2.textColor = .black
      activeLabel2.hashtagColor = .blue
      activeLabel2.handleHashtagTap { self.alert("hashtag", message: $0) }
    }
  }

  private let activeLabel3 = ActiveLabel()
  @IBOutlet private weak var activeLabelContainerView3: UIView! {
    didSet {
      activeLabelContainerView3.addSubview(activeLabel3)
      activeLabel3.snp.makeConstraints { $0.edges.equalToSuperview() }
      activeLabel3.numberOfLines = 0
      activeLabel3.enabledTypes = [.url]
      activeLabel3.text = "暇な時は https://twitter.com を覗くに限るね"
      activeLabel3.textColor = .black
      activeLabel3.URLColor = .green
      activeLabel3.handleURLTap { self.alert("URL", message: $0.absoluteString) }
    }
  }

  private let activeLabel4 = ActiveLabel()
  @IBOutlet private weak var activeLabelContainerView4: UIView! {
    didSet {
      activeLabelContainerView4.addSubview(activeLabel4)
      activeLabel4.snp.makeConstraints { $0.edges.equalToSuperview() }
      activeLabel4.numberOfLines = 0
      let actieType = ActiveType.custom(pattern: "\\s崎.\\b")
      activeLabel4.enabledTypes = [actieType]
      activeLabel4.text = "今日は雨だなああ 崎山 圭でええええす 崎田 でえす"
      activeLabel4.textColor = .black
      activeLabel4.customColor = [actieType: .systemPink]
      activeLabel4.handleCustomTap(for: actieType) { self.alert("custom", message: $0) }
    }
  }

  func alert(_ title: String, message: String) {
    let vc = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
    vc.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
    present(vc, animated: true, completion: nil)
  }
}

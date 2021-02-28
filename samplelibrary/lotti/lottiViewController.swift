//
//  lottiViewController.swift
//  samplelibrary
//
//  Created by 木元健太郎 on 2021/02/24.
//

import UIKit
import Lottie
import SnapKit

final class LottieViewController: UIViewController {

  private var isPlaying: Bool = false

  private let animationView1 = AnimationView()
  @IBOutlet private weak var animationContainerView1: UIView! {
    didSet {
      guard let animation = Animation.named("968-loading", subdirectory: nil) else {
        print("\(#line) file not found")
        return
      }
      animationContainerView1.addSubview(animationView1)
      animationView1.snp.makeConstraints { $0.edges.equalToSuperview() }
      animationView1.contentMode = .scaleAspectFit
      animationView1.animation = animation
    }
  }

  private let animationView2 = AnimationView()
  @IBOutlet private weak var animationContainerView2: UIView! {
    didSet {
      guard let animation = Animation.named("9629-loading", subdirectory: nil) else {
        print("\(#line) file not found")
        return
      }
      animationContainerView2.addSubview(animationView2)
      animationView2.snp.makeConstraints { $0.edges.equalToSuperview() }
      animationView2.contentMode = .scaleAspectFit
      animationView2.animation = animation
    }
  }

  private let animationView3 = AnimationView()
  @IBOutlet private weak var animationContainerView3: UIView! {
    didSet {
      guard let animation = Animation.named("9561-loading-unicorn", subdirectory: nil) else {
        print("\(#line) file not found")
        return
      }
      animationContainerView3.addSubview(animationView3)
      animationView3.snp.makeConstraints { $0.edges.equalToSuperview() }
      animationView3.contentMode = .scaleAspectFit
      animationView3.animation = animation
    }
  }

  @IBOutlet private weak var animationButton: UIButton! {
    didSet {
      animationButton.addTarget(self, action: #selector(tapAnimation(_:)), for: .touchUpInside)
    }
  }
}

extension LottieViewController {
  @objc func tapAnimation(_ sender: UIButton) {
    isPlaying.toggle()
    let animationViews = [animationView1, animationView2, animationView3]
    animationViews.forEach {
      if isPlaying {
        print("playing")
        $0.animationSpeed = 0.5
        $0.play(fromProgress: 0, toProgress: 1, loopMode: .loop)
      } else {
        print("stop")
        $0.stop()
      }
    }
  }
}

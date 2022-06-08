//
//  ImageViewEx.swift
//  RxSwiftSample
//
//  Created by HwangByungJo  on 2022/06/08.
//

import UIKit
import Kingfisher
import RxSwift
import RxCocoa

extension UIImageView {
        
  func setImage(urlString: String, disposeBag: DisposeBag) {
    
    APIService.fetch(urlString: urlString)
      .observe(on: MainScheduler.instance)
      .map({ data in
        return UIImage(data: data)
      })
      .bind(to: self.rx.image)
      .disposed(by: disposeBag)
    
//    self.image = nil
//    guard let url = URL(string: urlString) else { return }
//    self.kf.setImage(with: url,
//                     options: [ .transition(.fade(1) )])
  }
}

//
//  MainViewCell.swift
//  RxSwiftSample
//
//  Created by HwangByungJo  on 2022/06/08.
//

import UIKit
import RxSwift

class MainViewCell: UITableViewCell {
  
  @IBOutlet weak var name: UILabel!
  @IBOutlet weak var job: UILabel!
  @IBOutlet weak var age: UILabel!
  @IBOutlet weak var avatar: UIImageView!
  
  var disposeBag = DisposeBag()
  
  func updateCell(item:  Member) {
    
    name.text = item.name
    job.text = item.job
    age.text = "(\(item.age))"
    avatar.image = nil
    avatar.setImage(urlString: item.avatar, disposeBag: disposeBag)
  }
}

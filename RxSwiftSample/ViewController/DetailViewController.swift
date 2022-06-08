//
//  DetailViewController.swift
//  RxSwiftSample
//
//  Created by HwangByungJo  on 2022/06/08.
//

import UIKit
import Kingfisher
import RxSwift

class DetailViewController: UIViewController {
  
  @IBOutlet weak var avatar: UIImageView!
  @IBOutlet weak var name: UILabel!
  @IBOutlet weak var job: UILabel!
  @IBOutlet weak var age: UILabel!
  
  var disposeBag = DisposeBag()
  
  var data: Member?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configure()
  }
  
  private func configure() {
    
    guard let data = data else { return }
    
    name.text = data.name
    job.text = data.job
    age.text = "(\(data.age))"
    
    let urlString = data.avatar.replacingOccurrences(of: "size=50x50&", with: "")
    avatar.setImage(urlString: urlString, disposeBag: disposeBag)
  }
}

//
//  ViewController.swift
//  RxSwiftSample
//
//  Created by HwangByungJo  on 2022/06/07.
//

import UIKit
import RxSwift
import RxRelay
import RxCocoa

class ViewController: UIViewController {
  
  @IBOutlet weak var btnRefresh: UIBarButtonItem!
  @IBOutlet weak var tableView: UITableView!
  
  let viewModel = MemberViewModel()
  var disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configure()
  }
  
  private func configure() {
    
    viewModel.listObservable
      .observe(on: MainScheduler.instance)
      .bind(to: tableView.rx.items(cellIdentifier: "MainViewCell",
                                   cellType: MainViewCell.self)) { _ /*index*/, item, cell in
        cell.updateCell(item: item)
      }.disposed(by: disposeBag)
    
    tableView.rx.modelSelected(Member.self)
      .observe(on: MainScheduler.instance)
      .subscribe(onNext: { [weak self] member in
        self?.performSegue(withIdentifier: "pushDetailViewController", sender: member)
      })
      .disposed(by: disposeBag)
    
    btnRefresh.rx.tap
      .bind {
        self.viewModel.loadList()
      }
      .disposed(by: disposeBag)
    
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    guard let vc = segue.destination as? DetailViewController,
          let member = sender as? Member else { return }
    vc.data = member
  }
  
  
  
}


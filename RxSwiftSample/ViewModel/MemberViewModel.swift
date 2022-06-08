//
//  ViewModel.swift
//  RxSwiftSample
//
//  Created by HwangByungJo  on 2022/06/07.
//

import Foundation
import RxSwift
import RxRelay

class MemberViewModel {
    
  lazy var listObservable = BehaviorSubject<[Member]>(value: [])  
    
  init() {
    loadList()
  }
  
  func loadList() {
    _ = APIService.fetch(urlString: APIService.memberListURL)
      .map{ data in
        var list: [Member] = []
        do {
          let modelList = try JSONDecoder().decode([Member].self, from: data)
          list.append(contentsOf: modelList)
        } catch {
          print("Decoding Error : \(error.localizedDescription)")
        }
        return list
      }
      .bind(to: listObservable)
  }
}

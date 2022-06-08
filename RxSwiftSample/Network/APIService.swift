//
//  APIService.swift
//  RxSwiftSample
//
//  Created by HwangByungJo  on 2022/06/07.
//

import Foundation
import RxSwift

class APIService {
  
  static let memberListURL: String = "https://my.api.mockaroo.com/members_with_avatar.json?key=44ce18f0"
  
  static func fetch(urlString: String) -> Observable<Data> {
    
    return Observable.create { emitter in
      URLSession.shared.dataTask(with: URL(string: urlString)!) { data, res, err in
                                                
        if let err = err {
          emitter.onError(err)
        }
                        
        if let data = data {
          emitter.onNext(data)
        }
//        emitter.onCompleted()
        
      }.resume()
      return Disposables.create()
    }
  }
}


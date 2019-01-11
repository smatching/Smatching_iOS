//
//  SearchCookieService.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2019. 1. 11..
//  Copyright © 2019년 shineeseo. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

struct SearchCookieService : APIManager, Requestable {
    typealias NetworkData = ResponseArray<CommonResponse>
    typealias NetworkDataObj = ResponseObject<Notice>
    static let shared = SearchCookieService()
    let searchURL = url("/search")//url 상세주소
    let headers: HTTPHeaders = [
        "Authorization" : UserDefaults.standard.string(forKey: "token") ?? ""
    ]
    
    //최근 검색어 조회
    func getRecentSeachKeyword(completion: @escaping() ->Void) {
        let getURL = searchURL + "/log"
        
        gettable(getURL, body: nil, header: headers) {(res) in
            switch res {
            case .success(let value):
                print(value)
                guard let result = value.data else
                {return}
                completion(value.data)
            case .error(let error):
                print(error)
            }
            
        }
    }
}

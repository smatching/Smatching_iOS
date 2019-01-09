//
//  SearchService.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2019. 1. 5..
//  Copyright © 2019년 shineeseo. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

struct SearchService: APIManager, Requestable {
    typealias NetworkData = ResponseArray<Notice>
    typealias NetworkDataObj = ResponseObject<CommonResponse>
    static let shared = SearchService()
    var searchURL = url("/search")//url 상세주소
    let headers: HTTPHeaders = [
        "Content-Type" : "application/json",
        "Authorization" : UserDefaults.standard.string(forKey: "token") ?? ""
    ]
    
    func getSearchResultCount(query : String, completion: @escaping(CommonResponse)->Void) {
        let queryURL = searchURL + "/notices/count?query=\(query)"
        guard let encodingURL = queryURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        gettableObj(encodingURL, body: nil, header: headers) {(res) in
            switch res {
            case .success(let value):
                print(value)
                guard let result = value.data else
                {return}
                completion(result)
            case .error(let error):
                print(error)
            }
            
        }
        
    }
    func getSearchResult(query: String, request_num : Int? = 4, exist_num: Int? = 0, completion: @escaping([Notice]) -> Void) {
        let queryURL = searchURL + "/notices?query=\(query)&request_num=\(request_num ?? 4)&exist_num=\(exist_num ?? 0)"
        guard let encodingURL = queryURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        gettable(encodingURL, body: nil, header: headers) {(res) in
            switch res {
            case .success(let value):
                print(value)
                guard let result = value.data else
                {return}
                completion(result)
            case .error(let error):
                print(error)
            }
            
        }
    }
    //최근 검색어 조회
    func getRecentSeachKeyword(completion: @escaping() ->Void) {
        let getURL = searchURL + "/log"
        
        //        gettable(getURL, body: nil, header: headers) {(res) in
        //            switch res {
        //            case .success(let value):
        //                print(value)
        //                guard let result = value.data else
        //                {return}
        //                completion(value.data)
        //            case .error(let error):
        //                print(error)
        //            }
        //
        //        }
    }
    
    func getMyScrapNotices(query: String, request_num: Int? = 2, exist_num: Int? = 0, completion: @escaping([Notice])->Void) {
        let getURL = searchURL + "/notices/scrap?query=\(query)&request_num=\(request_num ?? 2)&exist_num=\(exist_num ?? 0)"
        
        guard let encodingURL = getURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        gettable(encodingURL, body: nil, header: headers) {(res) in
            switch res {
            case .success(let value):
                print(value)
                guard let result = value.data else
                {return}
                completion(result)
            case .error(let error):
                print(error)
            }
            
        }
        
    }
}

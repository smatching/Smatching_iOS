//
//  NoticeService.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2018. 12. 27..
//  Copyright © 2018년 shineeseo. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

struct NoticeService : APIManager, Requestable {
    typealias NetworkData = ResponseArray<Notice>
    static let shared = NoticeService()
    var noticeURL = url("/notices/list")//url 상세주소
    let headers: HTTPHeaders = [
        "Content-Type" : "application/json"
    ]
    
    
    func getAllNotice(request_num : Int? = 5, exist_num : Int? = 0, completion : @escaping([Notice]) -> Void) {
        let queryURL = noticeURL + "?request_num=\(request_num ?? 5)&exist_num=\(exist_num ?? 0)"
        
        gettable(queryURL, body: nil, header: headers){(res) in
            switch res {
            case .success(let value):
                guard let noticeList = value.data else
                {return}
                completion(noticeList)
            case .error(let error):
                print(error)
            }
        }
    }
}

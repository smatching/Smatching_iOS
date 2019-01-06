//
//  NoticeDetailService.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2019. 1. 5..
//  Copyright © 2019년 shineeseo. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

struct NoticeDetailService : APIManager, Requestable {
    typealias NetworkData = ResponseArray<Notice>
    typealias NetworkDataObj = ResponseObject<NoticeDetailResponse>
    static let shared = NoticeDetailService()
    var noticeURL = url("/notices")//url 상세주소
    let headers: HTTPHeaders = [
        "Content-Type" : "application/json"
    ]
    
    func getNoticeDetailInfo(notice_idx : Int, completion: @escaping(NoticeDetailResponse) ->Void) {
        let queryURL = noticeURL + "/detail?notice_idx=\(notice_idx)"
        
        gettableObj(queryURL, body: nil, header: headers) {(res) in
            switch res {
            case .success(let value):
                guard let notice = value.data else
                {return}
                completion(notice)
            case .error(let error):
                print(error)
            }
            
            
        }
    }
}

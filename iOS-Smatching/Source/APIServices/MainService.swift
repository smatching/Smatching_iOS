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

struct MainService : APIManager, Requestable {
    typealias NetworkData = ResponseObject<Main>
    static let shared = MainService()
    var mainURL = url("/main")//url 상세주소
    let headers: HTTPHeaders = [
        "Content-Type" : "application/json"
    ]
    
    mutating func getNotice(Authorization : String?, completion: @escaping(Main) -> Void) {
        if Authorization != nil {
            mainURL += "?Authorization=\(Authorization)"
        }
        gettable(mainURL, body: nil, header: headers){(res) in
            switch res {
            case .success(let value):
                guard let noticeList = value.data else
                {return}
                print(noticeList.fitNoticeCnt)
                completion(noticeList)
            case .error(let error):
                print(error)
            }
        }
    }
    
    
}

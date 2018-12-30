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
        "Content-Type" : "application/json",
        ]
    
    //홈탭에서 사용하는 전체지원사업 목록 조회
    func getAllNotice(request_num : Int? = 5, exist_num : Int? = 0, completion : @escaping([Notice]) -> Void) {
        let queryURL = noticeURL + "?request_num=\(request_num ?? 5)&exist_num=\(exist_num ?? 0)"
        var token = UserDefaults.standard.string(forKey: "token")
        
        guard let headers: HTTPHeaders = [
            "Authorization" : UserDefaults.standard.string(forKey: "token") as! String,
            ] else {}
        
        
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
    
    //홈탭에서 사용하는 맞춤지원사업 목록 조회
    func getFitNotice(cond_idx : Int? = 11,request_num : Int? = 3, exist_num : Int? = 0, completion : @escaping([Notice]) -> Void) {
        
        guard let headers: HTTPHeaders = [
            "Authorization" : UserDefaults.standard.string(forKey: "token") as! String,
            ] else {}
        
        let queryURL = noticeURL + "?request_num=\(request_num ?? 3)&exist_num=\(exist_num ?? 0)&cond_idx=\(cond_idx ?? 11)"
        
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

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
    typealias NetworkDataObj = ResponseObject<CommonResponse>
    static let shared = NoticeService()
    var noticeURL = url("/notices")//url 상세주소
    let headers: HTTPHeaders = [
        "Content-Type" : "application/json"
        ]
    
    //홈탭에서 사용하는 전체지원사업 목록 조회
    func getAllNotice(request_num : Int? = 5, exist_num : Int? = 0, completion : @escaping([Notice]) -> Void) {
        let queryURL = noticeURL + "/list?request_num=\(request_num ?? 5)&exist_num=\(exist_num ?? 0)"
        
        if let token = UserDefaults.standard.string(forKey: "token") as? String {
            let headers: HTTPHeaders = [
                "Authorization" : token
            ]
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
        } else {
            let headers: HTTPHeaders = [
                "Content-Type" : "application/json"
            ]
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
    
    //홈탭에서 사용하는 맞춤지원사업 목록 조회
    func getFitNotice(cond_idx : Int? = 11, request_num : Int? = 3, exist_num : Int? = 0, completion : @escaping([Notice]) -> Void) {
        
        guard let headers: HTTPHeaders = [
            "Authorization" : UserDefaults.standard.string(forKey: "token") as! String,
            ] else {}
        
        let queryURL = noticeURL + "/list?request_num=\(request_num ?? 3)&exist_num=\(exist_num ?? 0)&cond_idx=\(cond_idx ?? 11)"
        
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
    
    //맞춤지원사업 개수 조회
    func getFitNoticeCount(cond_idx : Int, completion : @escaping(CommonResponse) -> Void) {
        
        let headers: HTTPHeaders = [
            "Client" : "iOS"
            ]
        
        let queryURL = noticeURL + "/count?cond_idx=\(cond_idx)"
        
        gettableObj(queryURL, body: nil, header: headers){(res) in
            switch res {
            case .success(let value):
                guard let noticeCount = value.data else {return}
                completion(noticeCount)
            case .error(let error):
                print(error)
            }
        }
    }
    //전체지원사업 개수 조회
    func getAllNoticeCount(completion : @escaping(CommonResponse) -> Void) {
        
        let headers: HTTPHeaders = [
            "Client" : "iOS"
        ]
        
        let queryURL = noticeURL + "/count"
        
        gettableObj(queryURL, body: nil, header: headers){(res) in
            switch res {
            case .success(let value):
                guard let noticeCount = value.data else {return}
                completion(noticeCount)
            case .error(let error):
                print(error)
            }
        }
    }
    
    //지원사업 스크랩 여부 조회
    func getNoticeScrap(notice_idx : Int, completion : @escaping(CommonResponse) -> Void) {

        guard let headers: HTTPHeaders = [
            "Authorization" : UserDefaults.standard.string(forKey: "token") as! String,
            "Client" : "iOS"
            ] else {}

        let queryURL = noticeURL + "/scrap?notice_idx=\(notice_idx)"

        gettableObj(queryURL, body: nil, header: headers){(res) in
            switch res {
            case .success(let value):
                print(value.data)
                guard let isNoticeScrap = value.data else {return}
                completion(isNoticeScrap)
            case .error(let error):
                print(error)
            }
        }
    }
    
    //지원사업 스크랩 설정/해제
    func putNoticeScrap(noticeIdx : Int ,completion : @escaping(CommonResponse) -> Void) {
        
        let headers: HTTPHeaders = [
            "Authorization" : UserDefaults.standard.string(forKey: "token") as! String,
            "Client" : "iOS"
        ]
        
        let queryURL = noticeURL + "/scrap/\(noticeIdx)"
        
        puttable(queryURL, body: nil, header: headers){(res) in
            switch res {
            case .success(let value):
                print(value)
                guard let scrap = value.data else {return}
                completion(scrap)
            case .error(let error):
                print(error)
            }
        }
    }
    
}

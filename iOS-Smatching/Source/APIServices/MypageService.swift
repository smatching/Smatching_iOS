//
//  MypageService.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2019. 1. 7..
//  Copyright © 2019년 shineeseo. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

struct MypageService : APIManager, Requestable {
    typealias NetworkData = ResponseArray<Notice>
    typealias NetworkDataObj = ResponseObject<User>
    static let shared = MypageService()
    let userURL = url("/users")//url 상세주소
    let headers: HTTPHeaders = [
        "Content-Type" : "application/json",
         "Authorization" : UserDefaults.standard.string(forKey: "token") ?? ""
    ]
    
    //홈탭 유저의 맞춤조건 현황 조회
    func getUserInfo(completion : @escaping(User) -> Void) {
        let getURL = userURL + "/myinfo"
        gettableObj(getURL, body: nil, header: headers) {(res)in
            switch res {
            case .success(let value):
                print(value)
                guard let myinfo = value.data else {return}
                completion(myinfo)
            case .error(let error):
                print(error)
            }
        }
    }
    
    //홈탭 유저의 맞춤조건 현황 조회
    func getScrappedNotices(request_num: Int? = 3, exist_num: Int? = 0,completion : @escaping([Notice]) -> Void) {
        let getURL = userURL + "/noticelist?request_num=\(request_num ?? 3)&exist_num=\(exist_num ?? 0)"
        
        gettable(getURL, body: nil, header: headers) {(res)in
            switch res {
            case .success(let value):
                print(value)
                guard let notices = value.data else {return}
                completion(notices)
            case .error(let error):
                print(error)
            }
        }
    }
    //회원 정보 조회
    func getEditUserInfo(completion: @escaping(User) -> Void) {
        let getURL = userURL + "/edit"
        
        let headers: HTTPHeaders = [
            "Authorization" : UserDefaults.standard.string(forKey: "token") ?? ""
        ]
        
        gettableObj(getURL, body: nil, header: headers) {(res) in
            switch res {
            case .success(let value):
                print(value)
                guard let userInfo = value.data else {return}
                completion(userInfo)
            case .error(let error):
                print(error)
            }
        }
        
    }
}

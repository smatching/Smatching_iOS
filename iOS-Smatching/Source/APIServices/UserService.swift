//
//  UserService.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2018. 12. 15..
//  Copyright © 2018년 shineeseo. All rights reserved.
//

import Foundation
import Alamofire

struct UserService: APIManager, Requestable {
    typealias NetworkData = ResponseArray<User>
    typealias NetworkDataObj = ResponseObject<ConditionResponse>
    static let shared = UserService()
    let signupURL = url("/users")//url 상세주소
    let headers: HTTPHeaders = [
        "Content-Type" : "application/json"
    ]
    
    //회원가입
    func signUp(nickname: String, email: String, password: String, completion: @escaping() -> Void) {
        
        let body = [
            "nickname" : nickname,
            "email" : email,
            "password" : password
            ]
        postableObj(signupURL, body: body, header: headers) { res in
            switch res {
            case .success(let value):
                completion()
            case .error(let error):
                print(error)
            }
        }
    }
    
    //홈탭 유저의 맞춤조건 현황 조회
    func getUserCondition(completion : @escaping(ConditionResponse) -> Void) {
        let headers: HTTPHeaders = [
            "Content-Type" : "application/json",
            "Authorization" : UserDefaults.standard.string(forKey: "token") as! String
        ]
        let getURL = signupURL + "/cond"
        gettableObj(getURL, body: nil, header: headers) {(res)in
            switch res {
            case .success(let value):
                print(value.data?.condSummaryList)
                guard let conditionList = value.data else {return}
                completion(conditionList)
            case .error(let error):
                print(error)
            }
        }
        
        
    }
}

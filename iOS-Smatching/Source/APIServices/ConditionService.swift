//
//  ConditionService.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2018. 12. 29..
//  Copyright © 2018년 shineeseo. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

struct ConditionService : APIManager, Requestable {
    typealias NetworkData = ResponseArray<ConditionResponse>
    typealias NetworkDataObj = ResponseObject<ConditionResponse>
    static let shared = ConditionService()
    var conditionURL = url("/user/cond")//url 상세주소
    let headers: HTTPHeaders = [
        "Content-Type" : "application/json",
        "Authorization" : UserDefaults.standard.string(forKey: "token") as! String
        ]
    //홈탭 유저의 맞춤조건 현황 조회
    func getUserCondition(completion : @escaping(ConditionResponse) -> Void) {
        gettableObj(conditionURL, body: nil, header: headers) {(res)in
            switch res {
            case .success(let value):
                guard let conditionList = value.data else
                {return}
                completion(conditionList)
            case .error(let error):
                print(error)
            }
        }
            
        
    }
}

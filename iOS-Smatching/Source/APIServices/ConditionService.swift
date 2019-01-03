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
 
}
